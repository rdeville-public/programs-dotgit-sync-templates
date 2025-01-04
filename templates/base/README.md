<!-- markdownlint-disable -->
# 👋 Welcome to {{ name }}

<center>

> ⚠️ IMPORTANT !
>
> Main repo is on [framagit.org]({{ extra.repo.url }}).
>
> On other online git platforms, they are just mirror of the main repo.
>
> Any issues, pull/merge requests, etc., might not be considered on those other
> platforms.

</center>

---

<center>

{% if "secondaries" in licenses and licenses.secondaries | length > 0 -%}
[![Licenses: ({{ licenses.primary }} OR {{  licenses.secondaries | join(" OR ") }})][license_badge]][license_url]
{% else -%}
[![License: {{ licenses.primary }})][license_badge]][license_url]
{% endif -%}
[![Changelog][changelog_badge]][changelog_badge_url]
[![Build][build_badge]][build_badge_url]
[![Release][release_badge]][release_badge_url]

</center>

[build_badge]: {{ extra.repo.url }}/badges/main/pipeline.svg
[build_badge_url]: {{ extra.repo.url }}/-/commits/main
[release_badge]: {{ extra.repo.url }}/-/badges/release.svg
[release_badge_url]: {{ extra.repo.url }}/-/releases/
{% if "secondaries" in licenses and licenses.secondaries | length > 0 -%}
[license_badge]: https://img.shields.io/badge/Licenses-{{ licenses.primary }}%20OR%20{{ licenses.secondaries | join("%20OR%20") }}-blue
{% else -%}
[license_badge]: https://img.shields.io/badge/License-{{ licenses.primary }}-blue
{% endif -%}
[license_url]: {{ extra.repo.url }}/blob/main/LICENSE
[changelog_badge]: https://img.shields.io/badge/Changelog-Python%20Semantic%20Release-yellow
[changelog_badge_url]: https://github.com/python-semantic-release/python-semantic-release

{{ description }}

---
<!-- BEGIN DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
<!-- YOU CAN REPLACE THIS COMMENT AND PUT CUSTOM CONTENT HERE -->
<!-- YOUR CUSTOM CONTENT WILL NOT BE OVERRIDDEN -->
## 📌 Prerequisites

## ⚙️ Install

## 🚀 Usage

## ✅ Run tests

<!-- END DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page][issues_pages].

You can also take a look at the [CONTRIBUTING.md][contributing].

[issues_pages]: {{ extra.repo.url }}/-/issues
[contributing]: {{ extra.repo.url }}/blob/main/CONTRIBUTING.md

## 👤 Maintainers
{% for name, mail in maintainers.items() %}
* 📧 [**{{ name }}** \<{{ mail }}\>](mailto:{{ mail }})
  {%- if "maintainers" in extra and name in extra.maintainers %}
    {%- for maintainer_inf in extra.maintainers[name] %}
      {%- for key, val in extra.maintainers[name].socials.items() %}
  * {{ key }}: [{{ val.alt }}]({{ val.url }})
      {%- endfor %}
    {%- endfor %}
  {%- endif %}
{%- endfor %}

## 📝 License

{% if licenses.date.first_year == licenses.date.current_year -%}
Copyright © {{ licenses.date.current_year }}
{%- else -%}
Copyright © {{ licenses.date.first_year }} - {{ licenses.date.current_year }}
{%- endif %}
{%- for name, mail in licenses.copyright.items() %}
 * [{{ name }} \<{{ mail }}\>]({{ mail }})
{%- endfor %}

{% if "secondaries" in licenses and licenses.secondaries | length > 0 -%}
This project is under following licenses (**OR**) :

* [{{ licenses.primary }}][main_license]
  {%- for license in licenses.secondaries %}
* [{{ license }}][{{ license | lower }}_license]
  {%- endfor -%}
{% else -%}
This project is under [{{ licenses.primary }}][main_license].
{% endif %}

[main_license]: {{ extra.repo.url }}/blob/main/LICENSE
{% if "secondaries" in licenses and licenses.secondaries | length > 0 -%}
  {%- for license in licenses.secondaries -%}
[{{ license | lower }}_license]: {{ extra.repo.url }}/blob/main/LICENSE.{{ license }}
  {%- endfor -%}
{% endif -%}
{#
  vim: ft=markdown.jinja2
#}
