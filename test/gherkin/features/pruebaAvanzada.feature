Feature: Pruebas avanzadas de la aplicación de fotografía y reproductor multimedia

  # Pruebas de rendimiento
  Scenario: Medir tiempo de carga de la cámara
    Given la aplicación está cerrada
    When el usuario abre la cámara desde la aplicación
    Then se mide el tiempo que tarda en abrirse

  Scenario: Evaluar latencia en reproducción de audio
    Given el usuario ha seleccionado un archivo de audio
    When el usuario presiona el botón de reproducción
    Then se mide el tiempo hasta que el sonido empieza a reproducirse

  # Pruebas de carga
  Scenario: Uso de memoria al abrir muchas fotos
    Given la aplicación tiene acceso a la galería
    When el usuario abre múltiples imágenes en la aplicación
    Then se mide el consumo de memoria RAM

  Scenario: Carga en la CPU al reproducir audio
    Given la aplicación está reproduciendo un archivo de audio
    When el usuario reproduce un archivo de larga duración
    Then se mide el impacto en la CPU

  # Pruebas de estrés
  Scenario: Estabilidad tras 100 fotos seguidas
    Given la aplicación está abierta
    When el usuario toma 100 fotos consecutivas
    Then se verifica que la aplicación no falle ni se cierre inesperadamente

  Scenario: Reproducción continua de audio durante 1 hora
    Given la aplicación está reproduciendo un archivo de audio
    When la reproducción continúa sin interrupciones por 1 hora
    Then se verifica que la aplicación sigue funcionando sin errores

  # Pruebas de capacidad
  Scenario: Capacidad máxima de fotos en galería
    Given la aplicación tiene acceso a la galería
    When el usuario añade múltiples imágenes a la galería
    Then se determina el número máximo de imágenes soportadas sin fallos

  Scenario: Manejo de archivos de audio de gran tamaño
    Given el usuario selecciona un archivo de audio mayor a 100MB
    When intenta reproducirlo en la aplicación
    Then se verifica que la aplicación puede manejarlo correctamente

  # Pruebas de seguridad
  Scenario: Acceso a la galería sin permisos
    Given la aplicación no tiene permisos de acceso a la galería
    When el usuario intenta acceder a las fotos
    Then se verifica que la aplicación bloquea el acceso

  Scenario: Protección contra modificaciones no autorizadas
    Given un archivo de imagen almacenado por la aplicación
    When un usuario externo intenta modificar la imagen fuera de la app
    Then la aplicación debe bloquear la modificación

  # Pruebas de uso de recursos
  Scenario: Consumo de batería con la cámara activa
    Given la aplicación está utilizando la cámara
    When el usuario la mantiene encendida por 10 minutos
    Then se mide el porcentaje de batería consumido

  Scenario: Uso de CPU durante la reproducción de audio
    Given la aplicación está reproduciendo audio
    When se mide el consumo de CPU
    Then se verifica que el uso es optimizado
