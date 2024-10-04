import platform
import subprocess
import os

# Function to check if Python 2 is installed
def check_python2():
    try:
        subprocess.check_output(['python2', '-V'])
        return True
    except subprocess.CalledProcessError:
        return False

# Function to install Python 2 from source
def install_python2_from_source():
    try:
        # Download Python 2.7.9
        subprocess.check_call(['wget', 'https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz'])
        
        # Extract the downloaded tarball
        subprocess.check_call(['sudo', 'tar', 'xzf', 'Python-2.7.9.tgz'])
        
        # Change directory to the extracted folder
        os.chdir('Python-2.7.9')
        
        # Configure and install Python
        subprocess.check_call(['sudo', './configure', '--enable-optimizations'])
        subprocess.check_call(['sudo', 'make', 'altinstall'])
        
        # Verify installation
        subprocess.check_output(['python2.7', '-V'])
        
        # Create a symlink for python2
        subprocess.check_call(['sudo', 'ln', '-sfn', '/usr/local/bin/python2.7', '/usr/bin/python2'])
        
        # Update alternatives to use python2
        subprocess.check_call(['sudo', 'update-alternatives', '--install', '/usr/bin/python', 'python', '/usr/bin/python2', '1'])
        
        print("Python 2.7.9 installed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to install Python 2: {e}")

# Function to install Python 3 if not already installed
def install_python3():
    try:
        subprocess.check_call(['sudo', 'apt', 'update'])
        subprocess.check_call(['sudo', 'apt', 'install', 'python3'])
        print("Python 3 installed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to install Python 3: {e}")

# Main function to handle installation based on OS version
def main():
    os_name = platform.system()
    os_version = platform.release()

    # Check for supported Ubuntu versions (20.04, 22.04, and 22.10)
    if os_name == 'Linux' and os_version in ['20.04', '22.04', '22.10']:
        if check_python2():
            print("Python 2 is already installed.")
        else:
            install_python2_from_source()
    elif os_name == 'Linux' and os_version >= '23.04':
        print("Python 2 is deprecated in versions above Ubuntu 22.10.")
    else:
        print(f"Unsupported OS version: {os_name} {os_version}")

if __name__ == "__main__":
    main()
