Using Everything Search (Recommended for WSL Files)
The standard Windows search typically does not index the WSL filesystem efficiently. The third-party tool "Everything Search" can be configured to do this effectively. 

    Install Everything: Download and install the Everything Search utility.
    Open Options: In the Everything application, navigate to Menu:Tools > Options.
    Add WSL Path:
        Go to the Indexes > Folders tab.
        Click the Add button.
        In the Folder: box, enter \\wsl$\.
        Alternatively, to index a specific user's home directory (e.g., for Ubuntu), use \\wsl$\<linux flavor>\home\<username> (replace <linux flavor> and <username> with your details).
        Press OK on the dialog box and then OK on the main Options window.
    Wait for Indexing: Everything will start indexing the WSL directories. This may take some time depending on the amount of files (check the status bar for "scanning" indication).
    Search: Once indexing is complete, you can search for your WSL files directly within the Everything search bar. 