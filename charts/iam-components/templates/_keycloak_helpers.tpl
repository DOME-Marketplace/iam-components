{{/*
Expand the name of the chart.
*/}}
{{- define "keycloak.name" -}}
{{- default "keycloak" .Values.keycloak.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "keycloak.fullname" -}}
{{- if .Values.keycloak.fullnameOverride }}
{{- .Values.keycloak.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "keycloak" .Values.keycloak.nameOverride }}
{{- $releaseName := print .Release.Name "-keycloak" }}
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
{{- define "keycloak.chart" -}}
{{- $chartVersion := "0.0.0" }}
{{- range $i, $dep := .Chart.Dependencies }}
{{- if eq $dep.Name "keycloak" }}
{{- $chartVersion = $dep.Version }}
{{- end }}
{{- end }}
{{- printf "%s-%s" "keycloak" $chartVersion | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "keycloak.labels" -}}
{{- $chartVersion := "0.0.0" }}
{{- range $i, $dep := .Chart.Dependencies }}
{{- if eq $dep.Name "keycloak" }}
{{- $chartVersion = $dep.Version }}
{{- end }}
{{- end }}
helm.sh/chart: {{ include "keycloak.chart" . }}
{{ include "keycloak.selectorLabels" . }}
{{- if $chartVersion }}
app.kubernetes.io/version: {{ $chartVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app: {{ include "keycloak.name" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "keycloak.selectorLabels" -}}
{{- $releaseName := print .Release.Name "-keycloak" }}
app.kubernetes.io/name: {{ include "keycloak.name" . }}
app.kubernetes.io/instance: {{ $releaseName }}
{{- end }}
