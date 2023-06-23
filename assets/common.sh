#!/bin/bash
# https://github.com/ysx88/ysx88
# common Module by ysx88
# matrix.target=${FOLDER_NAME}

ACTIONS_VERSION="1.0.3"

function CPU_Priority() {
# 检测CPU型号,不是所选型号就重新触发启动
export TARGET_BOARD="$(awk -F '[="]+' '/TARGET_BOARD/{print $2}' build/${FOLDER_NAME}/${CONFIG_FILE})"
export TARGET_SUBTARGET="$(awk -F '[="]+' '/TARGET_SUBTARGET/{print $2}' build/${FOLDER_NAME}/${CONFIG_FILE})"
if [[ -n "$(grep -Eo 'CONFIG_TARGET.*x86.*64.*=y' build/${FOLDER_NAME}/${CONFIG_FILE})" ]]; then
  export TARGET_PROFILE="x86-64"
elif [[ -n "$(grep -Eo 'CONFIG_TARGET.*x86.*=y' build/${FOLDER_NAME}/${CONFIG_FILE})" ]]; then
  export TARGET_PROFILE="x86-32"
elif [[ -n "$(grep -Eo 'CONFIG_TARGET.*armsr.*armv8.*=y' build/${FOLDER_NAME}/${CONFIG_FILE})" ]]; then
  export TARGET_PROFILE="Armvirt_64"
elif [[ -n "$(grep -Eo 'CONFIG_TARGET.*armvirt.*64.*=y' build/${FOLDER_NAME}/${CONFIG_FILE})" ]]; then
  export TARGET_PROFILE="Armvirt_64"
elif [[ -n "$(grep -Eo 'CONFIG_TARGET.*DEVICE.*=y' build/${FOLDER_NAME}/${CONFIG_FILE})" ]]; then
  export TARGET_PROFILE="$(grep -Eo "CONFIG_TARGET.*DEVICE.*=y" build/${FOLDER_NAME}/${CONFIG_FILE} | sed -r 's/.*DEVICE_(.*)=y/\1/')"
else
  export TARGET_PROFILE="$(cat "build/${FOLDER_NAME}/${CONFIG_FILE}" |grep "CONFIG_TARGET_.*=y" |awk 'END {print}'|sed "s/CONFIG_TARGET_//g"|sed "s/=y//g")"
fi

cpu_model=`cat /proc/cpuinfo  |grep 'model name' |gawk -F : '{print $2}' | uniq -c  | sed 's/^ \+[0-9]\+ //g'`
TIME y "正在使用CPU型号：${cpu_model}"

start_path="${GITHUB_WORKSPACE}/build/${FOLDER_NAME}/relevance/settings.ini"
chmod -R +x ${start_path} && source ${start_path}

case "${CPU_SELECTION}" in
false)
  if [[ `echo "${cpu_model}" |grep -ic "E5"` -eq '1' ]]; then
    export chonglaixx="E5-重新编译"
    export chonglaiss="是E5的CPU"
    export Continue_selecting="1"
  else
    TIME g " 恭喜,不是E5系列的CPU啦"
    export Continue_selecting="0"
  fi
;;
8370|8272|8171)
  if [[ `echo "${cpu_model}" |grep -ic "${CPU_SELECTION}"` -eq '0' ]]; then
    export chonglaixx="非${CPU_SELECTION}-重新编译"
    export chonglaiss="并非是您选择的${CPU_SELECTION}CPU"
    export Continue_selecting="1"
  else
    TIME g " 恭喜,正是您想要的${CPU_SELECTION}CPU"
    export Continue_selecting="0"
  fi
;;
*)
  echo "${CPU_SELECTION},变量检测有错误"
  export Continue_selecting="0"
;;
esac

if [[ "${Continue_selecting}" == "1" ]]; then
  cd ${GITHUB_WORKSPACE}
  git clone https://github.com/${GIT_REPOSITORY}.git UPLOADCPU
  mkdir -p "UPLOADCPU/build/${FOLDER_NAME}/relevance"
  rm -rf UPLOADCPU/build/${FOLDER_NAME}
  cp -Rf build/${FOLDER_NAME} UPLOADCPU/build/${FOLDER_NAME}
  rm -rf UPLOADCPU/build/${FOLDER_NAME}/*.sh
  cp -Rf build/${FOLDER_NAME}/${DIY_PART_SH} UPLOADCPU/build/${FOLDER_NAME}/${DIY_PART_SH}
  rm -rf UPLOADCPU/.github/workflows
  cp -Rf .github/workflows UPLOADCPU/.github/workflows
  echo "${SOURCE}-${REPO_BRANCH}-${CONFIG_FILE}-$(date +%Y年%m月%d号%H时%M分%S秒)" > UPLOADCPU/build/${FOLDER_NAME}/relevance/start
  echo "DEVICE_NUMBER=${RUN_NUMBER}" > UPLOADCPU/build/${FOLDER_NAME}/relevance/run_number
  echo "chonglaiss=${chonglaiss}" >> UPLOADCPU/build/${FOLDER_NAME}/relevance/run_number
  
  cd UPLOADCPU
  BRANCH_HEAD="$(git rev-parse --abbrev-ref HEAD)"
  git add .
  git commit -m "${chonglaixx}-${FOLDER_NAME}-${LUCI_EDITION}-${TARGET_PROFILE}固件"
  git push --force "https://${REPO_TOKEN}@github.com/${GIT_REPOSITORY}" HEAD:${BRANCH_HEAD}
  exit 1
fi
}

function Diy_delruns() {
cd ${GITHUB_WORKSPACE}
sudo apt-get -qq update && sudo apt-get -qq install -y jq curl
if [[ -f "build/${FOLDER_NAME}/relevance/run_number" ]]; then
  DEVICE_NUMBER="$(grep "DEVICE_NUMBER" build/${FOLDER_NAME}/relevance/run_number |cut -d"=" -f2)"
  chonglaiss="$(grep "chonglaiss" build/${FOLDER_NAME}/relevance/run_number |cut -d"=" -f2)"
fi
all_workflows_list="josn_api_workflows"
curl -s \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer ${REPO_TOKEN}" \
https://api.github.com/repos/${GIT_REPOSITORY}/actions/runs |
jq -c '.workflow_runs[] | select(.conclusion == "failure") | {date: .updated_at, id: .id, name: .name, run_number: .run_number}' \
>${all_workflows_list}
if [[ -n "$(cat "${all_workflows_list}" |grep "${DEVICE_NUMBER}")" ]]; then
  cat ${all_workflows_list} |grep "${DEVICE_NUMBER}" > josn_api
fi
if [[ -f "josn_api" && -n "$(cat josn_api | jq -r .id)" ]]; then
  cat josn_api | jq -r .id | while read run_id; do
    {
      curl -s \
      -X DELETE \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer ${REPO_TOKEN}" \
      https://api.github.com/repos/${GIT_REPOSITORY}/actions/runs/${run_id}
    }
  done
  TIME y "已清理因筛选服务器CPU而停止的工作流程(编号:${DEVICE_NUMBER})，因为这${chonglaiss}"
fi
}
