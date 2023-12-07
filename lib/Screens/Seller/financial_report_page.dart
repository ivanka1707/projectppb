import 'package:flutter/material.dart';

class FinancialReportPage extends StatelessWidget {
  const FinancialReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Jenis Laporan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MonthlyFinancialReportPage()),
                );
              },
              child: const Text('Laporan Keuangan Bulanan'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const YearlyFinancialReportPage()),
                );
              },
              child: const Text('Laporan Keuangan Tahunan'),
            ),
          ],
        ),
      ),
    );
  }
}

class MonthlyFinancialReportPage extends StatefulWidget {
  const MonthlyFinancialReportPage({super.key});

  @override
  _MonthlyFinancialReportPageState createState() => _MonthlyFinancialReportPageState();
}

class _MonthlyFinancialReportPageState extends State<MonthlyFinancialReportPage> {
  final Map<String, dynamic> _monthlyReport2022 = {
    'January': {'income': 5000, 'expenses': 3000},
    'February': {'income': 6000, 'expenses': 3500},
    // ... data lainnya
  };

  final Map<String, dynamic> _monthlyReport2023 = {
    'January': {'income': 7000, 'expenses': 4000},
    'February': {'income': 5500, 'expenses': 3000},
    // ... data lainnya
  };

  String _selectedMonth = 'January';
  String _selectedYear = '2022';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Keuangan Bulanan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Pilih Bulan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedMonth,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMonth = newValue!;
                });
              },
              items: (_selectedYear == '2022' ? _monthlyReport2022 : _monthlyReport2023).keys
                  .map<DropdownMenuItem<String>>((String month) {
                return DropdownMenuItem<String>(
                  value: month,
                  child: Text(month),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pilih Tahun',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedYear,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedYear = newValue!;
                });
              },
              items: ['2022', '2023'].map<DropdownMenuItem<String>>((String year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showMonthlyFinancialReport(context, _selectedMonth, _selectedYear);
              },
              child: const Text('Tampilkan Laporan'),
            ),
          ],
        ),
      ),
    );
  }

  void _showMonthlyFinancialReport(BuildContext context, String selectedMonth, String selectedYear) {
    int income = (selectedYear == '2022'
        ? _monthlyReport2022[selectedMonth]['income']
        : _monthlyReport2023[selectedMonth]['income']);
    int expenses = (selectedYear == '2022'
        ? _monthlyReport2022[selectedMonth]['expenses']
        : _monthlyReport2023[selectedMonth]['expenses']);
    int profit = income - expenses;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Laporan Keuangan $selectedMonth $selectedYear'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pendapatan: $income'),
              Text('Biaya: $expenses'),
              Text('Keuntungan: $profit'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

class YearlyFinancialReportPage extends StatefulWidget {
  const YearlyFinancialReportPage({super.key});

  @override
  _YearlyFinancialReportPageState createState() => _YearlyFinancialReportPageState();
}

class _YearlyFinancialReportPageState extends State<YearlyFinancialReportPage> {
  final Map<String, dynamic> _yearlyReport = {
    '2022': {'income': 72000, 'expenses': 42000},
    '2023': {'income': 85000, 'expenses': 50000},
    // ... data lainnya
  };

  String _selectedYear = '2022'; // Tahun awal yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Keuangan Tahunan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Pilih Tahun',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedYear,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedYear = newValue!;
                });
              },
              items: _yearlyReport.keys.map<DropdownMenuItem<String>>((String year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showYearlyFinancialReport(context, _selectedYear);
              },
              child: const Text('Tampilkan Laporan'),
            ),
          ],
        ),
      ),
    );
  }

  void _showYearlyFinancialReport(BuildContext context, String selectedYear) {
    int yearlyIncome = _yearlyReport[selectedYear]['income'];
    int yearlyExpenses = _yearlyReport[selectedYear]['expenses'];
    int yearlyProfit = yearlyIncome - yearlyExpenses;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Laporan Keuangan Tahun $selectedYear'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pendapatan: $yearlyIncome'),
              Text('Biaya: $yearlyExpenses'),
              Text('Keuntungan: $yearlyProfit'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
