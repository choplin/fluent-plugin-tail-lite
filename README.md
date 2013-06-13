# Fluent::Plugin::TailLite

This plugin extendis in_tail to emit each line as it is.

## Installation

`$ fluent-gem install fluent-plugin-tail-lite`

## Configuration

### Example

```
<source>
  type   tail_lite
  path   /var/log/message
  tag    syslog
  record record
</source>
```

### Parameter

|parameter|description|default|
|---|---|---|
|field_name|attribute name where lines in log files will go|message|

in_tail parametes are available in common.

## Copyright

<table>
<tr><td>Copyright</td><td>Copyright (c) 2013 OKUNO Akihiro</td></tr>
<tr><td>License</td><td>Apache License, Version 2.0</td></tr>
</table>
