.PHONY: clean dist help import unpack

REPO_NAME=training-courses

CC_COURSE=Core\ Contributor\ Onboarding
CC_COURSE_TAR=dist/$(CC_COURSE).tar.gz
OEX_INTRO_COURSE=Intro\ To\ Open\ edX\ Course
OEX_INTRO_COURSE_TAR=dist/$(OEX_INTRO_COURSE).tar.gz
DEV_INTRO_COURSE=Open\ edX\ Developer\ Onboarding
DEV_INTRO_COURSE_TAR=dist/$(DEV_INTRO_COURSE).tar.gz
OLX_EXAMPLE_COURSE=olx_example_course
OLX_EXAMPLE_COURSE_TAR=dist/olx_example_course.tar.gz

help: ## Display this help message.
	@echo "Please use \`make <target>' where <target> is one of"
	@grep '^[a-zA-Z]' $(MAKEFILE_LIST) | sort | awk -F ':.*?## ' 'NF==2 {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

clean: ## Delete all generated course exports.
	rm -f $(CC_COURSE_TAR) $(OEX_INTRO_COURSE_TAR) $(DEV_INTRO_COURSE_TAR)

dist_cc: clean ## Create/overwrite exports in ./dist/ folder for courses
	cd $(CC_COURSE) && tar czfv ../$(CC_COURSE_TAR) ./course/

dist_intro:
	cd $(OEX_INTRO_COURSE) && tar czfv ../$(OEX_INTRO_COURSE_TAR) ./course/

dist_dev:
	cd $(DEV_INTRO_COURSE) && tar czfv ../$(DEV_INTRO_COURSE_TAR) ./course/

dist_olx:
	cd $(OLX_EXAMPLE_COURSE) && tar czfv ../$(OLX_EXAMPLE_COURSE_TAR) ./course/	

gitclean:  ## Remove hidden system files that are ignored by git.
	git clean -dfX

unpack: ## Unpack course exports from ./dist/ folder into source OLX.
	[ -f $(CC_COURSE_TAR) ] && mkdir -p $(CC_COURSE) && (cd $(CC_COURSE) && tar xzfv ../$(CC_COURSE_TAR)) || echo "No course to unpack."
	[ -f $(OEX_INTRO_COURSE_TAR) ] && mkdir -p $(OEX_INTRO_COURSE) && (cd $(OEX_INTRO_COURSE) && tar xzfv ../$(OEX_INTRO_COURSE_TAR)) || echo "No course to unpack."
	[ -f $(DEV_INTRO_COURSE_TAR) ] && mkdir -p $(DEV_INTRO_COURSE) && (cd $(DEV_INTRO_COURSE) && tar xzfv ../$(DEV_INTRO_COURSE_TAR)) || echo "No course to unpack."
	[ -f $(OLX_EXAMPLE_COURSE_TAR) ] && mkdir -p $(OLX_EXAMPLE_COURSE) && (cd $(OLX_EXAMPLE_COURSE) && tar xzfv ../$(OLX_EXAMPLE_COURSE_TAR)) || echo "No course to unpack."

unpack_cc:
	[ -f $(CC_COURSE_TAR) ] && mkdir -p $(CC_COURSE) && (cd $(CC_COURSE) && tar xzfv ../$(CC_COURSE_TAR)) || echo "No course to unpack."

unpack_intro:
	[ -f $(OEX_INTRO_COURSE_TAR) ] && mkdir -p $(OEX_INTRO_COURSE) && (cd $(OEX_INTRO_COURSE) && tar xzfv ../$(OEX_INTRO_COURSE_TAR)) || echo "No course to unpack."

unpack_dev:
	[ -f $(DEV_INTRO_COURSE_TAR) ] && mkdir -p $(DEV_INTRO_COURSE) && (cd $(DEV_INTRO_COURSE) && tar xzfv ../$(DEV_INTRO_COURSE_TAR)) || echo "No course to unpack."

unpack_olx:
	[ -f $(OLX_EXAMPLE_COURSE_TAR) ] && mkdir -p $(OLX_EXAMPLE_COURSE) && (cd $(OLX_EXAMPLE_COURSE) && tar xzfv ../$(OLX_EXAMPLE_COURSE_TAR)) || echo "No course to unpack."
