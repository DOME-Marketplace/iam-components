{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "kong.namespace" -}}
{{- default .Release.Namespace .Values.namespace -}}
{{- end -}}

{{- define "kong.name" -}}
{{- default "kong" (.Values.kong).nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kong.fullname" -}}
{{- $name := default "kong" (.Values.kong).nameOverride -}}
{{- $releaseName := print .Release.Name "-kong" }}
{{- printf "%s-%s" $releaseName $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kong.chart" -}}
{{- $chartVersion := "0.0.0" }}
{{- range $i, $dep := .Chart.Dependencies }}
{{- if eq $dep.Name "kong" }}
{{- $chartVersion = $dep.Version }}
{{- end }}
{{- end }}
{{- printf "%s-%s" "kong" $chartVersion | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kong.metaLabels" -}}
{{- $releaseName := print .Release.Name "-kong" }}
{{- $chartVersion := "0.0.0" }}
{{- range $i, $dep := .Chart.Dependencies }}
{{- if eq $dep.Name "kong" }}
{{- $chartVersion = $dep.Version }}
{{- end }}
{{- end }}
app.kubernetes.io/name: {{ template "kong.name" . }}
helm.sh/chart: {{ template "kong.chart" . }}
app.kubernetes.io/instance: "{{ $releaseName }}"
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
app.kubernetes.io/version: {{ $chartVersion | quote }}
{{- range $key, $value := (.Values.kong).extraLabels }}
{{ $key }}: {{ $value | quote }}
{{- end }}
{{- end -}}

{{- define "kong.selectorLabels" -}}
{{- $releaseName := print .Release.Name "-kong" }}
app.kubernetes.io/name: {{ template "kong.name" . }}
app.kubernetes.io/component: app
app.kubernetes.io/instance: "{{ $releaseName }}"
{{- end -}}