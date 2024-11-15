CUR_DIR=$(PWD)
BUILD_PATH=build
APP_PATH=sysroot/var/lib/casaos/appstore/default.new
OS=linux
ARCHITECHTURE=amd64
FEATURE= featured-apps.json
CATEGORY= category-list.json
RECOMMEND= recommend-list.json
APP_LIST_DIR=Apps
build_appstore: yes | cp -f  ${FEATURE} ${CATEGORY} ${RECOMMEND} ${BUILD_PATH}/${APP_PATH} && \
				yes | cp -rvf ${APP_LIST_DIR} ${BUILD_PATH}/${APP_PATH}
package: