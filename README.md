Tocdown.vim is a Vim plugin to to display the headlines of a markdown document in an extra window.


## Description ##

When you are writing a tons of documents in markdown with many headings and you want to get an
overview about all the  headlines you have, would it be very handy to have shortcut in Vim to simply
give you a structured representation of all the heading you have in your large markdown file?

The great taglist.vim plugin solved the problem already for variables and functions of many
different programming languages but not for plain markdown-files. That's why I wrote tocdown.


## Installation ##

Unzip the most recent ZIP (https://github.com/matthias-guenther/tocdown/zipball/master) archive file
inside your Vim profile directory (usually  `~/.vim`). The plugin is compatible with Tim Popes
pathogen script.

## Usage ##

Simply press `:TocdownToggle` and the extra window with the headline
of the current file will open. If you call `:TocdownToggle` again,
the window will be closed.

When you know how you want to use this plugin, you can use
a custom mapping in your |:vimrc| to toggle the toc of a md-file

    nnoremap <F2> :TocdownToggle

You can change the mapping to your needs.



## Contribute/Contact ##

Feature request, bugs, questions, etc. can be send to <matthias.guenther@wikimatze.de>. You can even
fork this project.


## License ##

This software is licensed under the [MIT license][mit].

© 2011 Matthias Guenther <matthias.guenther@wikimatze.de>.

[mit]: http://en.wikipedia.org/wiki/MIT_License

