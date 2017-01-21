.PHONY: lint test install

lint:
	shellcheck *.sh

test:
	@echo "This is my commit message.\n\nThere are many others like it, but this one is mine." > /tmp/git-muzak-test
	@./git-muzak.sh /tmp/git-muzak-test
	@cat /tmp/git-muzak-test

install:
	cp ./git-muzak.sh /usr/local/bin/git-muzak

uninstall:
	rm /usr/local/bin/git-muzak
