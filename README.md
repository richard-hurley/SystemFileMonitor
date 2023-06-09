# SystemFileMonitor

As this main.py file stands currently it runs as a demo where it collects the file hashes and then 30 seconds later it checks them again.

<img src="https://github.com/offwhitepanda/SystemFileMonitor/assets/117415145/886acaad-48d8-43cd-a58f-9bebe2e0824c">


### Download code

download the zip folder<br>
create a folder on your desktop called "SystemFileChecker"<br>
copy the contents of the download to the "SystemFileChecker" folder so that the structure looks like this<br>
```
SystemFileChecker
- install
    - prepare_environment.ps1
- main.py
- check_file_hashes.py
- etc
```

## Windows Instructions

### Prepare environment

open PowerShell or Windows Terminal as an Administrator and run prepare_environment.ps1<br>
close the terminal when finished<br>

### You will need to pip install a few libraries in the project directory:

open PowerShell or Windows Terminal as an Administrator<br>
change directory to the SystemFileChecker folder<br>

#### run:

```
python.exe -m pip install --upgrade pip
pip install plyer
```

#### usage examples:

###### main.py intitializes and creates the db and does a test check after 30 seconds
```
python.exe main.py
```
###### check_file_hashes simply re-checks file hashes (db must be created already)
```
python check_file_hashes.py
```

## Ubuntu Instructions

### Prepare environment

open terminal at the project folder location and:

```
sudo su
pip install plyer
```

#### usage examples:

###### main.py intitializes and creates the db and does a test check after 30 seconds
```
python3 main.py
```
###### check_file_hashes simply re-checks file hashes (db must be created already)
```
python3 check_file_hashes.py
```



