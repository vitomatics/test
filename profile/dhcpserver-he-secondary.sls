# SiFive HE secondary DHCP server
# Like the primary but without a few bits and pieces, e.g. dynamic pools

{% extends "profile/dhcpserver-he-primary.sls" %}

{% block he_unix01_dynamic %}
{% endblock %}

{% block he_unix02_dynamic %}
{% endblock %}

{% block subnet_extra %}
{% endblock %}

