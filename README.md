#Jekyll Vagrant

*A simple vagrant box for doing jekyll work.*

##Instructions
*This vagrant box is intended to be used with another repo*

1. Clone the repo in your repo collection (ie ~/GitHub/)
2. cd into the repo
3. from with in the repo
  * clone your existing jekyll site repo
  * create a new folder for a new jekyll site
4. Open the VagrantFile and change the text [[site_name]] to your site name (ie google.com)
5. from within the jekyll_vagrant repo run vagrant up
6. from within the jekyll_vagrant repo run vagrant ssh
7. cd /vagrant
8. run jekyll watch --build
9. from your computer open your browser and go to localhost:4000
10. you are up and running now start building your site

