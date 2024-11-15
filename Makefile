CUR_DIR=$(PWD)
BUILD_PATH=build
APP_PATH=sysroot/var/lib/casaos/appstore/default.new
OS=linux
ARCHITECTURE=amd64
FEATURE=featured-apps.json
CATEGORY=category-list.json
RECOMMEND=recommend-list.json
APP_LIST_DIR=Apps
SCRIPT_DIR=scripts

build_appstore:
	if [ ! -d "${BUILD_PATH}/${APP_PATH}" ]; then mkdir -p ${BUILD_PATH}/${APP_PATH}; fi
	cp -f ${FEATURE} ${CATEGORY} ${RECOMMEND} ${BUILD_PATH}/${APP_PATH}
	cp -rvf ${APP_LIST_DIR} ${BUILD_PATH}/${APP_PATH}
	cp -rvf ${SCRIPT_DIR} ${BUILD_PATH}

package:
	tar -czvf ${OS}-${ARCHITECTURE}-nextzenos-appstore.tar.gz ${BUILD_PATH}

package_zip:
	zip -r ${OS}-${ARCHITECTURE}-nextzenos-appstore.zip ${BUILD_PATH}

clean:
	if [ -d "${BUILD_PATH}" ]; then rm -rf ${BUILD_PATH}; fi
	if [ -f "${OS}-${ARCHITECTURE}-nextzenos-appstore.tar.gz" ]; then rm -f ${OS}-${ARCHITECTURE}-nextzenos-appstore.tar.gz; fi
	if [ -f "${OS}-${ARCHITECTURE}-nextzenos-appstore.zip" ]; then rm -f ${OS}-${ARCHITECTURE}-nextzenos-appstore.zip; fi