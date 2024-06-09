{#-<!-- markdownlint-disable-file -->-#}
# 👋 Welcome to {{ name }}
{%- set repo_url = extra.repo.server + extra.repo.namespace + "/" + name %}

<center>

{% if "others" in licenses and licenses.others | length > 0 -%}
[![Licenses: ({{ licenses.main }} OR {{  licenses.others | join(" OR ") }})][license_badge]][license_url]
{% else -%}
[![License: {{ licenses.main }})][license_badge]][license_url]
{% endif -%}
[![Changelog][changelog_badge]][changelog_badge_url]
[![Build][build_badge]][build_badge_url]
[![Release][release_badge]][release_badge_url]

</center>

[build_badge]: {{ repo_url }}/badges/main/pipeline.svg
[build_badge_url]: {{ repo_url }}/-/commits/main
[release_badge]: {{ repo_url }}/-/badges/release.svg
[release_badge_url]: {{ repo_url }}/-/releases/
{% if "others" in licenses and licenses.others | length > 0 -%}
[license_badge]: https://img.shields.io/badge/Licenses-{{ licenses.main }}%20OR%20{{ licenses.others | join("%20OR%20") }}-blue
{% else -%}
[license_badge]: https://img.shields.io/badge/License-{{ licenses.main }}-blue
{% endif -%}
[license_url]: {{ repo_url }}/blob/main/LICENSE
[changelog_badge]: https://img.shields.io/badge/Changelog-Python%20Semantic%20Release-yellow
[changelog_badge_url]: https://github.com/python-semantic-release/python-semantic-release

> {{ description }}

---
<!-- BEGIN DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
<!-- YOU CAN REPLACE THIS COMMENT AND PUT CUSTOM CONTENT HERE -->
<!-- YOUR CUSTOM CONTENT WILL NOT BE OVERRIDDEN -->
## 📌 Prerequisites

## ⚙️ Install

## 🚀 Usage

## ✅ Run tests

<!-- END DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
{%- set repo_url = extra.repo.server + extra.repo.namespace + "/" + name %}
## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page][issues_pages].

You can also take a look at the [CONTRIBUTING.md][contributing].

[issues_pages]: {{ repo_url }}/-/issues
[contributing]: {{ repo_url }}/blob/main/CONTRIBUTING.md

## 👤 Maintainers
{% for maintainer in maintainers %}
* 📧 [**{{ maintainer.name }}** \<{{ maintainer.mail }}\>](mailto:{{ maintainer.mail }})
  {%- if "maintainers" in extra and maintainer.name in extra.maintainers %}
    {%- for maintainer_inf in extra.maintainers[maintainer.name] %}
      {%- for key, val in extra.maintainers[maintainer.name].socials.items() %}
  * {{ key }}: [{{ val.alt }}]({{ val.url }})
      {%- endfor %}
    {%- endfor %}
  {%- endif %}
{%- endfor %}

## 📝 License

{% if date.first_year == date.current_year -%}
Copyright © {{ date.current_year }} [{{ licenses.copyright.owner }}]({{ licenses.copyright.email }})
{%- else -%}
Copyright © {{ date.first_year }} - {{ date.current_year }} {{ licenses.copyright.owner }}
{%- endif %}

{% if "others" in licenses and licenses.others | length > 0 -%}
This project is under following licenses (**OR**) :

* [{{ licenses.main }}][main_license]
  {%- for license in licenses.others %}
* [{{ license }}][{{ license | lower }}_license]
  {%- endfor -%}
{% else -%}
This project is under [{{ licenses.main }}][main_license].
{% endif %}

[main_license]: {{ repo_url }}/blob/main/LICENSE
{% if "others" in licenses and licenses.others | length > 0 -%}
  {%- for license in licenses.others -%}
[{{ license | lower }}_license]: {{ repo_url }}/blob/main/LICENSE.{{ license }}
  {%- endfor -%}
{% endif -%}
{#
  vim: ft=markdown.jinja2
#}
