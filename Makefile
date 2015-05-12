PROJECT = tirerl

DEPS = lager sync jiffy shotgun worker_pool
dep_lager = git https://github.com/basho/lager.git 2.1.1
dep_sync = git git://github.com/inaka/sync.git 0.1.3
dep_jiffy = git https://github.com/davisp/jiffy.git 0.13.3
dep_shotgun = git https://github.com/inaka/shotgun.git 0.1.8
dep_worker_pool = git https://github.com/inaka/worker_pool 1.0.2

DIALYZER_DIRS := ebin/
DIALYZER_OPTS := --verbose --statistics -Wrace_conditions

include erlang.mk

ERLC_OPTS += +'{parse_transform, lager_transform}'
TEST_ERLC_OPTS += +'{parse_transform, lager_transform}'

CT_SUITES = root_handler
CT_OPTS = -erl_args -config rel/sys.config

SHELL_OPTS = -name ${PROJECT}@`hostname` -s ${PROJECT} -s sync -config rel/sys.config
