
{{/*
Selector labels
*/}}
{{- define "portal.portalServerSelectorLabels" -}}
app.kubernetes.io/name: {{ include "portal.servername" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}



{{/*
Get the portal server auth secret name .
*/}}
{{- define "portal.portalserverAuthSecretName" -}}
{{- if .Values.portalServer.auth.existingSecret }}
    {{- printf "%s" (tpl .Values.portalServer.auth.existingSecret $) -}}
{{- else -}}
    {{- printf "%s-auth" (include "portal.servername" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a portal server auth secret object should be created
*/}}
{{- define "portal.portalserverAuthCreateSecret" -}}
{{- if .Values.portalServer.auth.existingSecret -}}
{{- else -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Get the portal server mail secret name .
*/}}
{{- define "portal.portalserverMailSecretName" -}}
{{- if .Values.portalServer.mail.existingSecret }}
    {{- printf "%s" (tpl .Values.portalServer.mail.existingSecret $) -}}
{{- else -}}
    {{- printf "%s-mail" (include "portal.servername" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a portal server mail secret object should be created
*/}}
{{- define "portal.portalserverMailCreateSecret" -}}
{{- if .Values.portalServer.mail.existingSecret -}}
{{- else -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Get the portal server keys secret name .
*/}}
{{- define "portal.portalserverKeysSecretName" -}}
{{- if .Values.portalServer.keys.existingSecret }}
    {{- printf "%s" (tpl .Values.portalServer.keys.existingSecret $) -}}
{{- else -}}
    {{- printf "%s-keys" (include "portal.servername" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a portal server keys secret object should be created
*/}}
{{- define "portal.portalserverKeysCreateSecret" -}}
{{- if .Values.portalServer.keys.existingSecret -}}
{{- else -}}
    {{- true -}}
{{- end -}}
{{- end -}}


