import 'dart:io';

class PCControl {
  /// Restarts the PC.
  Future<void> restart() async {
    try {
      if (Platform.isWindows) {
        await Process.run('shutdown', ['/r', '/t', '0']);
      } else if (Platform.isLinux) {
        await Process.run('reboot', []);
      } else if (Platform.isMacOS) {
        await Process.run('sudo', ['shutdown', '-r', 'now']);
      } else {
        throw UnsupportedError('Platform not supported');
      }
      print('Restart command executed successfully.');
    } catch (e) {
      print('Error restarting: $e');
    }
  }

  /// Hibernates the PC.
  Future<void> hibernate() async {
    try {
      if (Platform.isWindows) {
        await Process.run('shutdown', ['/h']);
      } else if (Platform.isLinux) {
        await Process.run('systemctl', ['hibernate']);
      } else if (Platform.isMacOS) {
        throw UnsupportedError(
            'Hibernate is not supported on macOS by default.');
      } else {
        throw UnsupportedError('Platform not supported');
      }
      print('Hibernate command executed successfully.');
    } catch (e) {
      print('Error hibernating: $e');
    }
  }

  /// Shuts down the PC.
  Future<void> shutdown() async {
    try {
      if (Platform.isWindows) {
        await Process.run('shutdown', ['/s', '/t', '0']);
      } else if (Platform.isLinux) {
        await Process.run('shutdown', ['now']);
      } else if (Platform.isMacOS) {
        await Process.run('sudo', ['shutdown', '-h', 'now']);
      } else {
        throw UnsupportedError('Platform not supported');
      }
      print('Shutdown command executed successfully.');
    } catch (e) {
      print('Error shutting down: $e');
    }
  }
}
