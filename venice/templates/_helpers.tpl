{{/*
Expand the name of the chart.
*/}}
{{- define "venice.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "venice.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "venice.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "venice.labels.client" -}}
helm.sh/chart: {{ include "venice.chart" . }}
{{ include "venice.selectorLabels.client" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "venice.labels.router" -}}
helm.sh/chart: {{ include "venice.chart" . }}
{{ include "venice.selectorLabels.router" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "venice.labels.server" -}}
helm.sh/chart: {{ include "venice.chart" . }}
{{ include "venice.selectorLabels.server" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "venice.labels.controller" -}}
helm.sh/chart: {{ include "venice.chart" . }}
{{ include "venice.selectorLabels.controller" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "venice.selectorLabels.client" -}}
app.kubernetes.io/name: {{ include "venice.name" . }}-client
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "venice.selectorLabels.router" -}}
app.kubernetes.io/name: {{ include "venice.name" . }}-router
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "venice.selectorLabels.server" -}}
app.kubernetes.io/name: {{ include "venice.name" . }}-server
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "venice.selectorLabels.controller" -}}
app.kubernetes.io/name: {{ include "venice.name" . }}-controller
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "venice.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "venice.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
