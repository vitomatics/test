# SiFive HE primary DHCP server

{% extends "profile/dhcpserver-he-secondary.sls" %}

{% block he_unix01_dynamic %}
{% endblock %}

{% block he_unix02_dynamic %}
{% endblock %}

{% block subnet_extra %}
{% endblock %}
