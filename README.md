# Packer Template
Template to build a vagrant box hosted on atlas.hashicorp.com

This has been a learning experiment for myself while also providing me with a backup
and easy deployment of my working environment on any machine.

From here feel free to clone, mess around and configure it to your likings before pushing
it to atlas for your own custom box.

## Requirments

* Packer

For documentation and a very helpful step-by-step guide in installing packer visit
atlas.hashicorp.com

## Use
To use simply:

`$ git clone https://github.com/amwill04/LAMP-Python-PhantomJS-WebScrapping-Build`


## Further Development
The build currently isn't utilising puppet cm. Puppet has been installed and the
next version will apply modules that have written for the vagrant file currently
located at amwill04/LAMP-PP.

## Special Thanks
The script files, excluding puppet.sh are default scripts from the packer tutorial
template file.

My json file was heavily influenced by git shiguredo/packer-templates with
the preseed.cfg file coming directly from their template.
