# How to build Vagrant Box

## Windows: add vbox to PATH for VBoxManage

    C:\Program Files\Oracle\VirtualBox

## Build box

0. List available boxes

        veewee vbox templates

0. Define box

        veewee vbox define 'OMS-Storm' 'CentOS-6.3-x86_64-minimal'

0. build box

        veewee vbox build 'OMS-Storm'

0. validate box

        veewee vbox validate 'OMS-Storm'

0. export box

        vagrant package --base 'OMS-Storm' --output 'OMS-Storm.box'
        
0. Register box with vagrant

        vagrant box add 'OMS-Storm' OMS-Storm.box
        
0. Remove veewee VM

        veewee vbox destroy 'OMS-Storm'