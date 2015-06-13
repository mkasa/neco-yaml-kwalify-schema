# What is "neco-yaml-kwalify-schema"?

neco-yaml-kwalify-schema is a vim plugin for
schema-aware completion and validation for YAML files.

What it provides when you edit a YAML file on vim are:

- syntax checking (requires Syntastic)
- schema validation (requires Kwalify)
- code completion (requires Neocomplete)
- autohelp (requires Neocomplete).

# Screenshots
Syntax checking:
![Syntax
checking](https://www.evernote.com/shard/s75/sh/0e3515cb-0ae2-45b8-88c0-49277b7b923b/e75e8b836c7b7236/res/6a7ed704-5b81-4f0c-91c5-509c08275694/skitch.png)

Schema validation:
![Schema
validation](https://www.evernote.com/shard/s75/sh/9f1f487b-74db-48a6-8b42-15c7c9c3c680/e71cd05940848d98/res/c27122e6-8b2a-4fba-a767-1479b9c3810b/skitch.png)

Schema-aware completion:
![Schema-aware completion](https://www.evernote.com/shard/s75/sh/ea8b41bd-497e-4c5c-8f6a-08d08f91f548/f3d1114a264dd595/res/26d6fa2d-68eb-467d-80e4-21dffe9b4c08/skitch.png)

Autohelp:
![Autohelp](https://www.evernote.com/shard/s75/sh/9c3324f9-9cf1-4da0-b8ea-6f1a6e2bd5c0/993df94e146d886a/res/d4edad79-5c50-40b4-a409-c185e6481e8f/skitch.png)

# Installation

neco-yaml-kwalify-schema depends on the following plugins or software:

- Syntastic (https://github.com/scrooloose/syntastic)
- Kwalify (http://www.kuwata-lab.com/kwalify/)
- Neocomplete (https://github.com/Shougo/neocomplete.vim)
- Ruby (a support script of the plugin is written in Ruby)

I don't explain how to install a vim plugin, but basically you can use
whatever plugin managers, such as Pathogen or Neobundle.

Next you need to put bin/kwalify-check in any directory on PATH. Please make
sure that kwalify is also somewhere on PATH. If you see
neco-yaml-kwalify-schema complain Kwalify or kwalify-check cannot be executed,
please check the PATH environment variable. Note that PATH that vim uses
might be different from what you use (e.g.,
http://stackoverflow.com/questions/12691814/path-in-vim-is-different-from-which-in-shell-mac-osx)

You might need to upgrade your vim to enjoy better syntax highlighting and
better autoindent, because YAML support (i.e., the default YAML ftplugin) in
older versions of vim is not good enough.

# Basic Usage

Enable Neocomplete and Syntastic for YAML. If you installed the both plugins
successfully, they are enabled by default so you do not have to do anything.
If you only need syntax checking, you are already all set.

To turn on schema validation, you need to tell the plugin where you put the
schema file. We use a comment for that. We assume the schema file is at
/home/foo/schema.yml, then you need to put the following comment in a YAML
file you are editing.

```
# Schema: /home/foo/schema.yml
```

This comment can be anywhere in the file so you can put it in the head of
the file or the tail of the file, or even in the middle. It is searched by
a simple regular expression, so it can be put in non-comment regions if
you wish, although not recommended. Anyway, the plugin passes to Kwalify
/home/foo/schema.yml as a schema file. If you specify a relative path,
it becomes relative to "~/.kwalify". Once you set this comment, you see
the code completion and the autohelp working.

# License

neco-yaml-kwalify-schema is distributed under the MIT license.
