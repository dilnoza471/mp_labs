import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  List<Map<String, dynamic>> _rates = [];
  bool _isLoading = false;
  String? _error;

  static const String _base =
      'https://cbu.uz/ru/arkhiv-kursov-valyut/json';

  @override
  void dispose() {
    _dateController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _fetchRates() async {
    setState(() {
      _isLoading = true;
      _error = null;
      _rates = [];
    });

    final code = _codeController.text.trim();
    final date = _dateController.text.trim();

    Uri uri;
    try {
      if (code.isEmpty || code.toLowerCase() == 'all') {
        if (date.isEmpty) {
          uri = Uri.parse('$_base/');
        } else {
          uri = Uri.parse('$_base/all/$date/');
        }
      } else {
        final upper = code.toUpperCase();
        if (date.isEmpty) {
          uri = Uri.parse('$_base/$upper/');
        } else {
          uri = Uri.parse('$_base/$upper/$date/');
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Invalid input / URL formation error.';
      });
      return;
    }

    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) {
        setState(() {
          _isLoading = false;
          _error = 'Failed to fetch rates: ${response.statusCode}';
        });
        return;
      }

      final decoded = jsonDecode(response.body);
      List<Map<String, dynamic>> list = [];

      if (decoded is List) {
        list = List<Map<String, dynamic>>.from(
          decoded.map((e) => Map<String, dynamic>.from(e as Map)),
        );
      } else if (decoded is Map) {
        list = [Map<String, dynamic>.from(decoded)];
      } else {
        setState(() {
          _isLoading = false;
          _error = 'Unexpected response format';
        });
        return;
      }

      setState(() {
        _rates = list;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Error: $e';
      });
    }
  }

  String _getName(Map<String, dynamic> m) {
    return (m['CcyNm_RU'] ??
            m['CcyNm_UZ'] ??
            m['CcyNm_EN'] ??
            m['CcyNm'] ??
            m['Name'] ??
            '')
        .toString();
  }

  String _getCode(Map<String, dynamic> m) {
    return (m['Ccy'] ?? m['Code'] ?? m['ccy'] ?? '').toString();
  }

  String _getRate(Map<String, dynamic> m) {
    final rate = m['Rate'] ?? m['rate'] ?? m['Exch'] ?? '';
    return rate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'Date (YYYY-MM-DD) — leave empty for today',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.datetime,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _codeController,
            decoration: const InputDecoration(
              labelText: 'Currency code (USD, RUB or "all")',
              border: OutlineInputBorder(),
            ),
            textCapitalization: TextCapitalization.characters,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _fetchRates,
                  child: const Text('Fetch Rates'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (_isLoading) const Expanded(child: Center(child: CircularProgressIndicator())),
          if (!_isLoading && _error != null)
            Expanded(
              child: Center(
                child: Text(_error!),
              ),
            ),
          if (!_isLoading && _error == null)
            Expanded(
              child: _rates.isEmpty
                  ? const Center(child: Text('No results'))
                  : ListView.separated(
                      itemCount: _rates.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final item = _rates[index];
                        final name = _getName(item);
                        final code = _getCode(item);
                        final rate = _getRate(item);
                        return ListTile(
                          title: Text(name.isNotEmpty ? name : code),
                          subtitle: Text('Code: $code'),
                          trailing: Text('Rate: $rate UZS'),
                        );
                      },
                    ),
            ),
        ],
      ),
    );
  }
}