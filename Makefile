.PHONY: lint test

lint:
	shellcheck *.sh

test:
	@echo "This is my commit message.\n\nThere are many others like it, but this one is mine." > /tmp/git-muzak-test
	@./git-muzak.sh /tmp/git-muzak-test
	@cat /tmp/git-muzak-test
