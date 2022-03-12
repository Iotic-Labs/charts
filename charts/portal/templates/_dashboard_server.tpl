
{{- define "portal.dashboardservername" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-dashsvr" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "portal.dashboardServerSelectorLabels" -}}
app.kubernetes.io/name: {{ include "portal.dashboardservername" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Get the dashboardserver secret name .
*/}}
{{- define "portal.dashboardserverSecretName" -}}
{{- if .Values.dashboardServer.existingSecret }}
    {{- printf "%s" (tpl .Values.dashboardServer.existingSecret $) -}}
{{- else -}}
    {{- printf "%s" (include "portal.dashboardservername" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "portal.dashboardserverCreateSecret" -}}
{{- if .Values.dashboardServer.existingSecret -}}
{{- else -}}
    {{- true -}}
{{- end -}}
{{- end -}}

