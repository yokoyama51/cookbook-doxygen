# site-doxygen Cookbook

## Requirements

### Platforms

- CentOS

### Chef

- Chef 12.0 or later

### Cookbooks

- build-essential

## Attributes

- node['doxygen']['version'] - Doxygen version to install
- node['doxygen']['url'] - URL to Doxygen source package
- node['doxygen']['checksum'] - Source package SHA256 checksum

### doxygen::default

e.g.
Just include `doxygen` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[doxygen]"
  ]
}
```

### doxygen::source

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[doxygen::source]"
  ]
}
```
