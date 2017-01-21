# git-muzak
> Background music for your git commits

Inserts the currently playing iTunes track in your git commit messages.

This is done in the "prepared" message, so you can still edit it in your $EDITOR if you decide the track is too awesome or something.

![git-music-ss2](https://cloud.githubusercontent.com/assets/40650/22171332/3c3ce1f2-df59-11e6-8215-aa20c4570560.png)

If you are doing a quick commit message e.g. with `-m`, things will still work:

![git-music-results-github-app-ss](https://cloud.githubusercontent.com/assets/40650/22171382/a0c1ca4c-df5a-11e6-8b83-835cafaf9602.png)

Requires a macOS environment (obviously), and for one to be old-fashioned enough (like me) to still use iTunes to play your MP3s.

## Installation

Clone this repository and copy the `git-muzak.sh` script to somewhere in your `$PATH`, with your desired name, e.g.:

    cp git-muzak.sh /usr/local/bin/git-muzak

For simplicity, this is exactly what is done for you via `make install`.

## Usage

To enable for a git repository, once you are somewhere inside its directory, simply do `git muzak --install`.

    $ git muzak --install
    √♬  Linked .git/hooks/prepare-commit-msg to /usr/local/bin/git-muzak

Behind the scenes, this will symlink the script as the `prepare-commit-msg` git hook.
