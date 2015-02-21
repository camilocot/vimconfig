from invoke import task
import subprocess
import os
import platform


def git(git_cwd="~/", *args):
    return subprocess.check_call(['git'] + list(args), cwd=git_cwd)


def package_manager(dist):
    return {
        'fedora': 'yum',
        'debian': 'apt'
    }[dist]


@task
def install_packages():
    dist = platform.linux_distribution()
    for pack in ['ctags', 'ack']:
        subprocess.call(
            ["sudo", package_manager(dist[0].lower()), "install", pack])


def get_home():
    return os.path.expanduser("~")


def create_sym_link():
    link = get_home() + "/.vimrc"
    if not os.path.isfile(link):
        os.symlink(get_home() + "/.vim/vimrc", link)


def init_submodules():
    link = get_home() + "/.vim/"
    git(link, "submodule", "init")
    git(link, "submodule", "update", "--recursive")


@task
def build():
    print "Installing packages"
    install_packages()
    print "Creating sym link"
    create_sym_link()
    print "Init submodules "
    init_submodules()
    pass
