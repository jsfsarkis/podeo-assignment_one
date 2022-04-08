import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podeo_assignment_one/cubits/calculator/calculator_cubit.dart';
import 'package:podeo_assignment_one/ui/theme/app_colors.dart';
import 'package:podeo_assignment_one/ui/widgets/calculator_button.dart';

class CalculatorScreen extends StatelessWidget {
  static const String id = 'calculator_screen';

  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: _buildAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildText(context),
          _buildCalculator(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      elevation: 0,
      leading: BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
          return GestureDetector(
            child: const Icon(
              Icons.history,
              color: AppColors.accent,
              size: 50,
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.background,
                  builder: (context) {
                    if (state.history.isEmpty) {
                      return const Center(
                        child: Text(
                          'Do some calculations! :)',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      );
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.read<CalculatorCubit>().clearHistory();
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: AppColors.accent,
                                      size: 40,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ListView.separated(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.history[index.toString()][0],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                        ),
                                      ),
                                      Text(
                                        state.history[index.toString()][1],
                                        style: const TextStyle(
                                          color: AppColors.accent,
                                          fontSize: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) => const Divider(height: 2, color: Colors.grey),
                              itemCount: state.history.length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                            ),
                          ],
                        ),
                      );
                    }
                  });
            },
          );
        },
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: BlocBuilder<CalculatorCubit, CalculatorState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    state.expression,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    state.result,
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCalculator(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF2A2D37),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(
                    label: 'AC',
                    labelColor: AppColors.accent,
                    onTap: () {
                      context.read<CalculatorCubit>().reset();
                    },
                  ),
                  CalculatorButton(
                    label: '(',
                    labelColor: AppColors.accent,
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('(');
                    },
                  ),
                  CalculatorButton(
                    label: ')',
                    labelColor: AppColors.accent,
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression(')');
                    },
                  ),
                  CalculatorButton(
                    label: '÷',
                    labelColor: AppColors.accent,
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('÷');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(
                    label: '7',
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('7');
                    },
                  ),
                  CalculatorButton(
                    label: '8',
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('8');
                    },
                  ),
                  CalculatorButton(
                    label: '9',
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('9');
                    },
                  ),
                  CalculatorButton(
                    label: 'x',
                    labelColor: AppColors.accent,
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('x');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(
                    label: '4',
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('4');
                    },
                  ),
                  CalculatorButton(
                    label: '5',
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('5');
                    },
                  ),
                  CalculatorButton(
                    label: '6',
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('6');
                    },
                  ),
                  CalculatorButton(
                    label: '-',
                    labelColor: AppColors.accent,
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('-');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(
                    label: '1',
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('1');
                    },
                  ),
                  CalculatorButton(
                    label: '2',
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('2');
                    },
                  ),
                  CalculatorButton(
                    label: '3',
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('3');
                    },
                  ),
                  CalculatorButton(
                    label: '+',
                    labelColor: AppColors.accent,
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('+');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButton(
                    label: '0',
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('0');
                    },
                  ),
                  CalculatorButton(
                    label: '.',
                    onTap: () {
                      context.read<CalculatorCubit>().setExpression('.');
                    },
                  ),
                  CalculatorButton(
                    label: '<',
                    onTap: () {
                      context.read<CalculatorCubit>().delete();
                    },
                  ),
                  CalculatorButton(
                    label: '=',
                    labelColor: AppColors.accent,
                    onTap: () {
                      context.read<CalculatorCubit>().onEqualPressed();
                    },
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
