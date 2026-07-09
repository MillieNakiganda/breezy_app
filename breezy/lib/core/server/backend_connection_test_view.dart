import 'package:breezy/core/server/server_client.dart';
import 'package:flutter/material.dart';

class BackendConnectionTestView extends StatefulWidget {
  const BackendConnectionTestView({super.key});

  @override
  State<BackendConnectionTestView> createState() =>
      _BackendConnectionTestViewState();
}

class _BackendConnectionTestViewState extends State<BackendConnectionTestView> {
  final _nameController = TextEditingController(text: 'Breezy');

  String? _greeting;
  String? _error;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _callGreeting();
  }

  Future<void> _callGreeting() async {
    setState(() {
      _isLoading = true;
      _error = null;
      _greeting = null;
    });

    try {
      final result = await serverClient.greeting.hello(_nameController.text);
      setState(() {
        _greeting = result.message;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Backend connection test')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Server URL', style: theme.textTheme.titleSmall),
            const SizedBox(height: 4),
            SelectableText(serverUrl, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 24),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _callGreeting(),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _isLoading ? null : _callGreeting,
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Call greeting.hello'),
            ),
            const SizedBox(height: 24),
            Expanded(child: _buildResult(theme)),
          ],
        ),
      ),
    );
  }

  Widget _buildResult(ThemeData theme) {
    if (_isLoading) {
      return const Center(child: Text('Calling backend...'));
    }

    if (_error != null) {
      return _ResultCard(
        color: theme.colorScheme.errorContainer,
        title: 'Connection failed',
        message: _error!,
      );
    }

    if (_greeting != null) {
      return _ResultCard(
        color: Colors.green.shade100,
        title: 'Connected successfully',
        message: _greeting!,
      );
    }

    return const Center(child: Text('No response yet.'));
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({
    required this.color,
    required this.title,
    required this.message,
  });

  final Color color;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SelectableText(message),
        ],
      ),
    );
  }
}
