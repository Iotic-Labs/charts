
{{- define "portal.frontproxyname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-frontproxy" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Selector labels
*/}}
{{- define "portal.frontProxySelectorLabels" -}}
app.kubernetes.io/name: {{ include "portal.frontproxyname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


