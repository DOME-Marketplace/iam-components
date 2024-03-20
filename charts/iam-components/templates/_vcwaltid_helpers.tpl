{{/*
Expand the name of the chart.
*/}}
{{- define "waltid.name" -}}
{{- default "vcwaltid" .Values.vcwaltid.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "waltid.fullname" -}}
{{- if .Values.vcwaltid.fullnameOverride }}
{{- .Values.vcwaltid.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "vcwaltid" .Values.vcwaltid.nameOverride }}
{{- $releaseName := print .Release.Name "-vcwaltid" }}
{{- if contains $name $releaseName }}
{{- $releaseName | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" $releaseName $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "waltid.chart" -}}
{{- $chartVersion := "0.0.0" }}
{{- range $i, $dep := .Chart.Dependencies }}
{{- if eq $dep.Name "vcwaltid" }}
{{- $chartVersion = $dep.Version }}
{{- end }}
{{- end }}
{{- printf "%s-%s" "vcwaltid" $chartVersion | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "waltid.labels" -}}
{{- $chartVersion := "0.0.0" }}
{{- range $i, $dep := .Chart.Dependencies }}
{{- if eq $dep.Name "vcwaltid" }}
{{- $chartVersion = $dep.Version }}
{{- end }}
{{- end }}
helm.sh/chart: {{ include "waltid.chart" . }}
{{ include "waltid.selectorLabels" . }}
{{- if $chartVersion }}
app.kubernetes.io/version: {{ $chartVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app: {{ include "waltid.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "waltid.selectorLabels" -}}
{{- $releaseName := print .Release.Name "-vcwaltid" }}
app.kubernetes.io/name: {{ include "waltid.name" . }}
app.kubernetes.io/instance: {{ $releaseName }}
{{- end }}
