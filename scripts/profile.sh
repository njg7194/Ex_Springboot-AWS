#!/usr/bin/env bash

# 쉬고 있는 profile 찿기 : real1이 사용 중이면 real2가 쉬고 있고, 반대면 real1이 쉬고 있음.

function find_idle_profile()
{
  RESPONSE_CODE=$(curl -s -p /dev/null -w "%{http_code}"http://localhost/profile)

  if [ ${RESPONSE_CODE} -ge 400 ] # 400 보다 크면(즉, 40x/50x에러 모두 포함)
  
  then
    CURRENT_PROFILE=real2
  else
    CURRENT_PROFILE=$(curl -s http://localhost/profile)
  fi 
  
  if [ ${CUTTENT_PROFILE} == real1 ]
  then
    IDLE_PROFILE=real2
  else
    IDLE_PROFILE=real1  
  fi
  
  echo "${IDLE_PROFILE}"
}

# 쉬고 있는profile의port찿기
function find_idle_port()
{
    IDLE_PROFILE=$(find_idle_profile)

    if [ ${IDLE_PROFILE} == real1 ]
    then
      echo "8081"
    else
      echo "8082"
    fi
}