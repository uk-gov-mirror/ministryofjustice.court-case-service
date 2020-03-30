    {{/* vim: set filetype=mustache: */}}
{{/*
Environment variables for web and worker containers
*/}}
{{- define "deployment.envs" }}
env:
  - name: SERVER_PORT
    value: "{{ .Values.image.port }}"

  - name: SPRING_PROFILES_ACTIVE
    value: "postgres,logstash"

  - name: JAVA_OPTS
    value: "{{ .Values.env.JAVA_OPTS }}"

  - name: DATABASE_USERNAME
    valueFrom:
      secretKeyRef:
        name: "{{ .Values.secrets.db.secret_name }}"
        key: database_username

  - name: DATABASE_PASSWORD
    valueFrom:
      secretKeyRef:
        name: "{{ .Values.secrets.db.secret_name }}"
        key: database_password

  - name: DATABASE_NAME
    valueFrom:
      secretKeyRef:
        name: "{{ .Values.secrets.db.secret_name }}"
        key: database_name

  - name: DATABASE_ENDPOINT
    valueFrom:
      secretKeyRef:
        name: "{{ .Values.secrets.db.secret_name }}"
        key: rds_instance_endpoint

  - name: COMMUNITY_API_BASE_URL
    value: "{{ .Values.env.community_api.base_url }}"

  - name: NOMIS_OAUTH_BASE_URL
    value: "{{ .Values.env.nomis_oauth.base_url }}"

  - name: NOMIS_OAUTH_CLIENT_ID
    valueFrom:
      secretKeyRef:
        name: "{{ .Values.secrets.service.secret_name }}"
        key: nomis-oauth-client-id

  - name: NOMIS_OAUTH_CLIENT_SECRET
    valueFrom:
      secretKeyRef:
        name: "{{ .Values.secrets.service.secret_name }}"
        key: nomis-oauth-client-secret
{{- end -}}
