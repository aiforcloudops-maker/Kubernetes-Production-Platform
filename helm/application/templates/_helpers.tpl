{{/*
Expand the name of the chart.
*/}}
{{- define "cloudops-application.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a fully qualified app name.
*/}}
{{- define "cloudops-application.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- include "cloudops-application.name" . }}
{{- end }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "cloudops-application.labels" -}}
app.kubernetes.io/name: {{ include "cloudops-application.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}

{{/*
Selector labels.
*/}}
{{- define "cloudops-application.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cloudops-application.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
