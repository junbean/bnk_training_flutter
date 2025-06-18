import 'package:ex_bank/models/bank_product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final BankProduct product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  Color _getRiskColor(BuildContext context) {
    switch (product.riskLevel) {
      case '낮음':
        return Colors.green;
      case '중간':
        return Colors.orange;
      case '높음':
        return Colors.red;
      default:
        return Colors.grey[600]!;
    }
  }

  IconData _getCategoryIcon() {
    switch (product.category) {
      case '예금':
        return Icons.account_balance_wallet;
      case '적금':
        return Icons.credit_card;
      case '펀드':
        return Icons.bar_chart;
      case '대출':
        return Icons.home;
      case '신탁':
        return Icons.business_center;
      case '보험/공제':
        return Icons.shield;
      case '퇴직연금':
        return Icons.group;
      default:
        return Icons.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 헤더 영역
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCB2B11).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getCategoryIcon(),
                      color: const Color(0xFFCB2B11),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFCB2B11).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            product.category,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFCB2B11),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey[400], size: 16),
                ],
              ),

              const SizedBox(height: 12),

              // 설명
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 12),

              // 주요 정보
              Row(
                children: [
                  Expanded(
                    child: _InfoItem(
                      icon: Icons.percent,
                      label: '금리',
                      value: product.interestRate,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _InfoItem(
                      icon: Icons.attach_money,
                      label: '최소금액',
                      value: product.minimumAmount,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: _InfoItem(
                      icon: Icons.schedule,
                      label: '기간',
                      value: product.period,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.shield,
                          size: 14,
                          color: _getRiskColor(context),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '위험도: ${product.riskLevel}',
                          style: TextStyle(
                            fontSize: 12,
                            color: _getRiskColor(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
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

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey[500]),
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 11, color: Colors.grey[500]),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
