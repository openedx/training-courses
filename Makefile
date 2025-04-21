.PHONY: clean dist help import unpack

REPO_NAME=training-courses

CC_COURSE=Core\ Contributor\ Onboarding
CC_COURSE_TAR=dist/$(CC_COURSE).tar.gz

help: ## Display this help message.
	@echo "Please use \`make <target>' where <target> is one of"
	@grep '^[a-zA-Z]' $(MAKEFILE_LIST) | sort | awk -F ':.*?## ' 'NF==2 {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

clean: ## Delete all generated course exports.
	rm -f $(CC_COURSE_TAR)

dist: clean ## Create/overwrite exports in ./dist/ folder for courses
	cd $(CC_COURSE) && tar czfv ../$(CC_COURSE_TAR) ./course/

clean:  ## Remove hidden system files that are ignored by git.
	git clean -dfX

unpack: ## Unpack course exports from ./dist/ folder into source OLX.
	[ -f $(CC_COURSE_TAR) ] && mkdir -p $(CC_COURSE) && (cd $(CC_COURSE) && tar xzfv ../$(CC_COURSE_TAR)) || echo "No course to unpack."
