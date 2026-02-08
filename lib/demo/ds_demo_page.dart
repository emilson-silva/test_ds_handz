import 'package:flutter/material.dart';

import '../design_system/ds.dart';

class DSDemoPage extends StatefulWidget {
  const DSDemoPage({
    super.key,
    required this.brand,
    required this.onBrandChanged,
  });

  final DSBrand brand;
  final ValueChanged<DSBrand> onBrandChanged;

  @override
  State<DSDemoPage> createState() => _DSDemoPageState();
}

class _DSDemoPageState extends State<DSDemoPage> {
  final TextEditingController _controller = TextEditingController();
  bool _loading = false;
  bool _showError = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Design System Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DSSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Marca ativa', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: DSSpacing.sm),
            DropdownButton<DSBrand>(
              value: widget.brand,
              onChanged: (value) {
                if (value != null) {
                  widget.onBrandChanged(value);
                }
              },
              items: const [
                DropdownMenuItem(value: DSBrand.more, child: Text('More')),
                DropdownMenuItem(
                  value: DSBrand.moreAlt,
                  child: Text('More Alt'),
                ),
              ],
            ),
            const SizedBox(height: DSSpacing.xl),
            Text('Botoes', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: DSSpacing.md),
            Wrap(
              spacing: DSSpacing.md,
              runSpacing: DSSpacing.md,
              children: [
                DSButton(
                  label: _loading ? 'Carregando' : 'Primario',
                  isLoading: _loading,
                  onPressed: () {
                    setState(() {
                      _loading = !_loading;
                    });
                  },
                ),
                DSButton(
                  label: 'Secundario',
                  variant: DSButtonVariant.secondary,
                  onPressed: () {},
                ),
                DSButton(label: 'Desabilitado', onPressed: null),
              ],
            ),
            const SizedBox(height: DSSpacing.xl),
            Text('Input', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: DSSpacing.md),
            DSTextField(
              label: 'Email',
              helperText: 'Digite seu email profissional',
              errorText: _showError ? 'Email invalido' : null,
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _showError = value.isNotEmpty && !value.contains('@');
                });
              },
            ),
            const SizedBox(height: DSSpacing.xl),
            Text('Cards', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: DSSpacing.md),
            DSCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Resumo', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: DSSpacing.xs),
                  Text(
                    'Card de exemplo com texto e acao.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: DSSpacing.md),
            DSCard(
              variant: DSCardVariant.outlined,
              onTap: () {},
              semanticsLabel: 'Card clicavel',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Card outlined',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Icon(Icons.arrow_forward),
                ],
              ),
            ),
            const SizedBox(height: DSSpacing.xl),
            Text('Badges', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: DSSpacing.md),
            Wrap(
              spacing: DSSpacing.sm,
              runSpacing: DSSpacing.sm,
              children: const [
                DSBadge(label: 'Neutro'),
                DSBadge(label: 'Sucesso', variant: DSBadgeVariant.success),
                DSBadge(label: 'Aviso', variant: DSBadgeVariant.warning),
                DSBadge(label: 'Erro', variant: DSBadgeVariant.error),
                DSBadge(label: 'Info', variant: DSBadgeVariant.info),
              ],
            ),
            const SizedBox(height: DSSpacing.xl),
            Text('Divider', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: DSSpacing.md),
            const DSDivider(),
          ],
        ),
      ),
    );
  }
}
