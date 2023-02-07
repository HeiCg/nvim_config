<link rel="stylesheet" href="./style.css">

### Useful default commands


#### Mappings
> Case sensitive

ALT  -> <M-| with any key>
</br>
CTRL -> <C-| with any key>



#### nvim-autoparis

##### fastwrap

```text
Before        Input                    After
--------------------------------------------------
(|foobar      <M-e> then press $        (|foobar)
(|)(foobar)   <M-e> then press q       (|(foobar))
```


### Find and replace over folder or files

#### without lspsaga

- populate quickfix list with files
    ```vim
    :vimgrep /require/gj **/*.lua
    ```

    >note: you can also use other commands to popule the quickfix
    ```vim
    :args `grep require -l .`
    ```

    in the above command, "require" is our search pattern. The meanings of g and j flags are as follows:

    g: Add all matches in a line to the quickfix list.
    j: Do not jump the cursor to the location of first pattern match.

    The **/*.lua specify the files to search for the pattern. In this case, it means to search recursively
    under the current directory and for all .lua files types.

    To open the quickfix list
    ```vim
    :copen
    ```

    Apply replace operation over quickfix list
    ```vim
    :cfdo %s/require/require_/ge | update
    ```
    ```vim
    :argdo %s/require/require_/gc | update
    ```

    Apply macro over quickfix list
    ```vim
    :argdo normal @q | update
    ```



#### Ripgrep searching cheatsheet

| command	| Description |
| --------- | ----------- |
|rg image utils.py	| Search in a single file utils.py|
|rg image src/	| Search in dir src/ recursively|
|rg image	| Search image in current dir recursively|
|rg '^We' test.txt	| Regex searching support (lines starting with We)|
|rg -i image	| Search image and ignore case (case-insensitive search)|
|rg -s image	| Smart case search|
|rg -F '(test)'	| Search literally, i.e., without using regular expression|
|rg image -g '*.py'	| File globing (search in certain files), can be used multiple times|
|rg image -g '!*.py'	| Negative file globing (do not search in certain files)|
|rg image --type py or rg image -tpy1	| Search image in Python file|
|rg image -Tpy	| Do not search image in Python file type|
|rg -l image	| Only show files containing image (Do not show the lines)|
|rg --files-without-match image	| Show files not containing image|
|rg -v image	| Inverse search (search files not containing image)|
|rg -w image	| Search complete word|
|rg --count	| Show the number of matching lines in a file|
|rg --count-matches	| Show the number of matchings in a file|
|rg neovim --stats	| Show the searching stat (how many matches, how many files searched etc.)|
