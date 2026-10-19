import 'package:android/utils/constant.dart';
import 'package:flutter/material.dart';

class ClothCard extends StatefulWidget {
  const ClothCard({super.key});

  @override
  State<ClothCard> createState() => _ClothCardState();
}

class _ClothCardState extends State<ClothCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Stack(
                  children: [
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      fit: BoxFit.fill,
                    ),
                    
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.pinkLight,
                          borderRadius: BorderRadius.circular(6),
                          ),
                        child: Text('Nama Author', style: TextStyle(
                          fontFamily: 'Lora',
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary
                        )),
                      ),
                    ),
                    
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: 
                        const Text(
                          'The effortless layer',
                          style: TextStyle(
                            fontFamily: 'Lora',
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: AppColors.textWhite,
                          ),
                      ),
                    ),
                    
                    Positioned(
                      bottom: 4,
                      right: 10,
                      child: 
                        Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                            maxWidth: 20,
                            maxHeight: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.pinkLight,
                            borderRadius: BorderRadius.circular(90),
                            
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {}, 
                            icon: Icon(Icons.arrow_outward, 
                              size: 12, 
                              color: AppColors.primary,
                              
                               
                            ),
                          )
                        ),
                    ),
                  ],
                )
              ),

              // const SizedBox(height: 12),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: 
              // Text('The effortless layer', style: TextStyle(
              //         fontFamily: 'Lora',
              //         fontSize: 14,
              //         fontWeight: FontWeight.w600,
              //         color: AppColors.textPrimary
              //       )),
              //     ),
              //
              //     Container(
              //       padding: const EdgeInsets.all(6),
              //       decoration: BoxDecoration(
              //         color: AppColors.primary.withOpacity(0.1),
              //         shape: BoxShape.circle,
              //       ),
              //       child: Icon(Icons.arrow_outward, size: 16, color: AppColors.primary),
              //     ),
              //   ],
              // ),
              //
              // const SizedBox(height: 6),
              //
              // Text('Light trench + cotton tee + straight jeans...', style: TextStyle(
              //   color: AppColors.primary,
              //   fontSize: 12,
              //   height: 1.4,
              //   fontFamily: 'Plus Jakarta Sans',
              //   fontWeight: FontWeight.w500,
              // ))
            ],
          ),
        ),
      ),
    );
  }
}
