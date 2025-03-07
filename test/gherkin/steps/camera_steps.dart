import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart'; // Importa la librería para `expect`

StepDefinitionGeneric laAplicacionEstaEnLaPantallaDeCamara() {
  return given<FlutterWorld>(
    'la aplicación está en la pantalla de la cámara',
    (context) async {
      final SerializableFinder cameraButton =
          find.byTooltip('Tomar foto') as SerializableFinder;
      await context.world.driver?.waitFor(cameraButton);
    },
  );
}

StepDefinitionGeneric elUsuarioPresionaBotonTomarFoto() {
  return when<FlutterWorld>(
    'el usuario presiona el botón de tomar foto',
    (context) async {
      final SerializableFinder cameraButton =
          find.byTooltip('Tomar foto') as SerializableFinder;
      await context.world.driver?.tap(cameraButton);
    },
  );
}

StepDefinitionGeneric laAplicacionMuestraMensajeImagenGuardada() {
  return then<FlutterWorld>(
    'la aplicación muestra un mensaje de "Imagen guardada"',
    (context) async {
      final SerializableFinder successMessage =
          find.text('Imagen guardada') as SerializableFinder;

      // Simplemente espera a que el mensaje aparezca sin asignarlo a una variable.
      await context.world.driver?.waitFor(successMessage);
    },
  );
}
