cd ~/Linux-25-Tasks/Task_6
cat ./README.md

# 1
sudo useradd alice
sudo useradd bob
# 2
sudo groupadd project_group
# 3
sudo usermod -aG project_group alice
sudo usermod -aG project_group bob
# 4
zip ./files.zip ./files

# 5
sudo chown alice ./files.zip
# 6
sudo chgrp project_group ./files.zip
# 7
sudo chmod 640 ./files.zip
