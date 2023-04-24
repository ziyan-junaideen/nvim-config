# NeoVIM configuration

This is Ziyan's `nvim` configuration (V2). This is in a early state of
development. I am not writing this for you to use. The reason why I
choose NeoVIM (VIM like) is as a PDE (Personalized Development Environment).
This is personalized for me, you should find your own 🫢.

## Targetted Platforms

Targetted platforms are as follows and a result of my preferred and/or required
languages/frameworks for leasure and work.

- Ruby & Ruby on Rails (WIP)
- NodeJS / JavaScript (TODO)
- Elixir & Erlang (TODO)
- Flutter (TODO)
- Rust (TODO)
- Python (TODO)

**Note**: Ruby seems to have poor tooling support. Ruby LSP by shopify supports
code actions (corrections) but lacks basic features like jump to definition.
On the other hand, Solargraph supports indexing and jumps but doesn't seem to
provide code actions. Neither provides references 😭. The configuration allows
to use `gr` search through references using Telescope but it doesn't work with
Ruby.

If Elixir tooling is better, I will make Elixir my primary language, or may be
Rust 🫢.

## Installation

Installation instructions are currently speculated.

- Latest NeoVIM (if you are in Ubuntu, get a PPA)
- Clone the project to `~/.config/nvim` folder
- Open `nvim` and do a `PackerSync`
- Close and open `nvim`


## Future

- Dashboard with OrgMode integrated
- Config for JavaScript / Node JS
- Migrate to Lazy package manager
- Config for Elixir & Erlang

