Feature: Captura de imagen con la cámara

  Scenario: El usuario toma una foto exitosamente
    Given la aplicación está en la pantalla de la cámara
    When el usuario presiona el botón de tomar foto
    Then la aplicación muestra un mensaje de "Imagen guardada"

# Integracion

  Scenario: El usuario cambia de la cámara trasera a la delantera
    Given la aplicación está en la pantalla de la cámara
    When el usuario presiona el botón de cambiar cámara
    Then la cámara activa debería ser la delantera

  Scenario: El usuario activa y desactiva el flash
    Given la aplicación está en la pantalla de la cámara
    When el usuario presiona el botón de flash
    Then la aplicación debe activar el flash
    When el usuario presiona el botón de flash nuevamente
    Then la aplicación debe desactivar el flash

# Regresion

  Scenario: La imagen capturada se guarda correctamente
    Given la aplicación está en la pantalla de la cámara
    When el usuario presiona el botón de tomar foto
    Then la aplicación guarda la imagen en el almacenamiento del dispositivo


  Scenario: La aplicación sigue funcionando después de tomar una foto
    Given la aplicación está en la pantalla de la cámara
    When el usuario presiona el botón de tomar foto
    Then la aplicación no se debe cerrar inesperadamente

# Funcional

  Scenario: El usuario toma una foto sin errores
    Given la aplicación está en la pantalla de la cámara
    When el usuario presiona el botón de tomar foto
    Then la aplicación debe capturar la imagen sin errores

  Scenario: El usuario puede ver las fotos tomadas
    Given la aplicación está en la pantalla de fotos
    When el usuario accede a la galería
    Then la aplicación muestra las fotos tomadas previamente