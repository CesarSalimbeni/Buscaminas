import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// GestionDatos: helpers para persistir datos de juego usando SharedPreferences.
/// Funcionalidades:
/// - Guardar/obtener records (top 5) por dificultad.
/// - Guardar/obtener configuración de juego y preferencias de usuario.

class Record {
	final int tiempo; // tiempo en milisegundos
	final DateTime fecha;

	Record({required this.tiempo, required this.fecha});

	Map<String, dynamic> toJson() => {
				'tiempo': tiempo,
				'fecha': fecha.toIso8601String(),
			};

	static Record fromJson(Map<String, dynamic> json) {
		return Record(
			tiempo: json['tiempo'] as int,
			fecha: DateTime.parse(json['fecha'] as String),
		);
	}
}

class GestionDatos {
	GestionDatos._(); // solo static

	static const int _maxRecords = 5;

	static String _recordsKey(String dificultad) => 'records_$dificultad';
	static const String _configKey = 'config_buscamina';

	/// Añade un record para la dificultad dada y mantiene solo los mejores _maxRecords.
	static Future<void> guardarRecord(String dificultad, int tiempoMillis) async {
		final prefs = await SharedPreferences.getInstance();
		final key = _recordsKey(dificultad);
		final lista = await obtenerRecords(dificultad);

		lista.add(Record(tiempo: tiempoMillis, fecha: DateTime.now()));
		lista.sort((a, b) => a.tiempo.compareTo(b.tiempo));
		final trimmed = lista.take(_maxRecords).toList();

		final jsonString = json.encode(trimmed.map((r) => r.toJson()).toList());
		await prefs.setString(key, jsonString);
	}

	/// Obtiene la lista de records para la dificultad dada (orden ascendente por tiempo).
	static Future<List<Record>> obtenerRecords(String dificultad) async {
		final prefs = await SharedPreferences.getInstance();
		final key = _recordsKey(dificultad);
		final jsonString = prefs.getString(key);
		if (jsonString == null) return <Record>[];

		try {
			final List<dynamic> decoded = json.decode(jsonString) as List<dynamic>;
			return decoded
					.map((e) => Record.fromJson(Map<String, dynamic>.from(e as Map)))
					.toList();
		} catch (_) {
			return <Record>[];
		}
	}

	/// Borra los records de una dificultad.
	static Future<void> limpiarRecords(String dificultad) async {
		final prefs = await SharedPreferences.getInstance();
		await prefs.remove(_recordsKey(dificultad));
	}

	/// Guarda la configuración del juego y las preferencias de estilo.
	static Future<void> guardarConfiguracion({
		required String dificultad,
		required bool temaClaro,
		required String estiloNumeros,
		required bool animacionesActivas,
	}) async {
		final prefs = await SharedPreferences.getInstance();
		final map = {
			'dificultad': dificultad,
			'temaClaro': temaClaro,
			'estiloNumeros': estiloNumeros,
			'animacionesActivas': animacionesActivas,
		};
		await prefs.setString(_configKey, json.encode(map));
	}

	/// Obtiene la configuración guardada o null si no existe.
	static Future<Map<String, dynamic>?> obtenerConfiguracion() async {
		final prefs = await SharedPreferences.getInstance();
		final s = prefs.getString(_configKey);
		if (s == null) return null;
		try {
			final Map<String, dynamic> decoded = json.decode(s) as Map<String, dynamic>;
			return {
				'dificultad': decoded['dificultad'] as String,
				'temaClaro': decoded['temaClaro'] as bool,
				'estiloNumeros': decoded['estiloNumeros'] as String,
				'animacionesActivas': decoded['animacionesActivas'] as bool,
			};
		} catch (_) {
			return null;
		}
	}

	/// Elimina la configuración guardada.
	static Future<void> limpiarConfiguracion() async {
		final prefs = await SharedPreferences.getInstance();
		await prefs.remove(_configKey);
	}
}

