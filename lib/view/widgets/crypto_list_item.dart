import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../model/crypto_currency.dart';

class CryptoListItem extends StatelessWidget {
  final CryptoCurrency crypto;
  final VoidCallback onTap;

  const CryptoListItem({
    super.key,
    required this.crypto,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final String iconUrl = 'https://s2.coinmarketcap.com/static/img/coins/64x64/${crypto.id}.png';

    final Widget icon = CircleAvatar(
      radius: 20,
      backgroundColor: Colors.transparent,
      child: CachedNetworkImage(
        imageUrl: iconUrl, 
        placeholder: (context, url) => const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2.0),
        ),
        errorWidget: (context, url, error) => Text(
          crypto.symbol,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        fadeInDuration: const Duration(milliseconds: 300),
      ),
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      crypto.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      crypto.symbol,
                      style: TextStyle(
                        color: Colors.white.withAlpha(153),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    crypto.formattedPriceUsd,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    crypto.formattedPriceBrl,
                    style: TextStyle(
                      color: Colors.white.withAlpha(153),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}