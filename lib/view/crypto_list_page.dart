import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/crypto_currency.dart';
import '../viewmodel/crypto_viewmodel.dart';
import 'widgets/crypto_list_item.dart'; 

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CryptoViewModel>().fetchCryptos();
    });
  }
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cripto Ticker'),
      ),
      body: Consumer<CryptoViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _buildSearchField(viewModel),
                const SizedBox(height: 16),
                _buildBody(viewModel),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchField(CryptoViewModel viewModel) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Pesquisar Símbolos (ex: BTC,ETH)',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
      onSubmitted: (value) {
         viewModel.fetchCryptos(symbols: value.toUpperCase());
      },
    );
  }

  Widget _buildBody(CryptoViewModel viewModel) {
    if (viewModel.isLoading && viewModel.cryptoList.isEmpty) {
      return const Expanded(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (viewModel.errorMessage != null && viewModel.cryptoList.isEmpty) {
      return Center(
        child: Text('Erro: ${viewModel.errorMessage}'),
      );
    }

    if (viewModel.cryptoList.isEmpty) {
      return const Center(
        child: Text('Nenhuma criptomoeda encontrada.'),
      );
    }
    
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => viewModel.fetchCryptos(symbols: _searchController.text.toUpperCase()),
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          itemCount: viewModel.cryptoList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8), 
          itemBuilder: (context, index) {
            final crypto = viewModel.cryptoList[index];
            
            return CryptoListItem(
              crypto: crypto,
              onTap: () => _showDetailsDialog(context, crypto),
            );
          },
        ),
      ),
    );
  }

  void _showDetailsDialog(BuildContext context, CryptoCurrency crypto) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(crypto.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Símbolo: ${crypto.symbol}'),
              const SizedBox(height: 8),
              Text('Adicionada em: ${DateFormat('dd/MM/yyyy').format(crypto.dateAdded)}'),
              const SizedBox(height: 16),
              Text(
                'Cotação USD: ${crypto.formattedPriceUsd}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Cotação BRL: ${crypto.formattedPriceBrl}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('FECHAR'),
            ),
          ],
        );
      },
    );
  }
}