import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dictii/components/search_textfield.dart';
import 'package:dictii/constants/constant.dart';
import 'package:dictii/models/word_model.dart';
import 'package:dictii/services/api_service.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final TextEditingController _controller = TextEditingController();
  Word? _word;
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _debounce;

  void _onTextChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Lakukan sesuatu setelah user selesai mengetik
      _searchWord();
    });
  }

  void _searchWord() async {
    try {
      final query = _controller.text.trim();
      if (query.isEmpty) return;

      final word = await ApiService.fetchWord(query);
      setState(() {
        _word = word;
      });
      if (_word!.phonetics != null) {
        print("null");
      }
    } catch (e) {
      print(e);
    }
  }

  void _playAudio(String? url) async {
    if (url != null && url.isNotEmpty) {
      await _audioPlayer.play(UrlSource(url));
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9E7E7),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/bg.png',
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: SafeArea(
                      bottom: false,
                      child: SearchTextField(
                        label: 'Enter a word',
                        controller: _controller,
                        onSearch: _searchWord,
                        onChanged: _onTextChanged,
                      ),
                    ),
                  ),
                  if (_word != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(_word!.word,
                          style: kSemiBoldTextStyle.copyWith(fontSize: 30)),
                    ),
                  if (_word != null)
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          _word!.phonetic ?? 'No pronunciation found',
                          style:
                              kRegularTextStyle.copyWith(color: kGreyDarkText),
                        ),
                        if (_word!.phonetics != null && _word!.phonetics != "")
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_outlined,
                              color: Colors.purple,
                            ),
                            onPressed: () => _playAudio(_word!.phonetics),
                          ),
                      ],
                    ),
                  const SizedBox(height: 12),
                  Expanded(
                      child: (_word != null)
                          ? Scrollbar(
                              thumbVisibility: true,
                              thickness: 4,
                              radius: const Radius.circular(2),
                              child: SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (_word!.definitions != null)
                                        ..._word!.definitions!.map((def) =>
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                        style: kRegularTextStyle
                                                            .copyWith(
                                                                color: kBlack),
                                                        children: [
                                                      if (def.partOfSpeech !=
                                                          null)
                                                        TextSpan(
                                                          text:
                                                              '[${def.partOfSpeech}] ',
                                                          style:
                                                              kSemiBoldTextStyle
                                                                  .copyWith(
                                                            color:
                                                                Colors.purple,
                                                          ),
                                                        ),
                                                      if (def.definition !=
                                                          null)
                                                        TextSpan(
                                                            text:
                                                                '${def.definition}'),
                                                    ])),
                                                if (def.example != null)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 12,
                                                      ),
                                                      Text(
                                                        'Example:',
                                                        style: kSemiBoldTextStyle
                                                            .copyWith(
                                                                color: Colors
                                                                    .purple),
                                                      ),
                                                      Text(
                                                        '${def.example}',
                                                        style: kRegularTextStyle
                                                            .copyWith(),
                                                      ),
                                                    ],
                                                  ),
                                                if (def.synonyms != null &&
                                                    def.synonyms!.isNotEmpty)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 12,
                                                      ),
                                                      Text(
                                                        'Synonyms: ',
                                                        style: kSemiBoldTextStyle
                                                            .copyWith(
                                                                color: Colors
                                                                    .purple),
                                                      ),
                                                      Text(
                                                        def.synonyms!
                                                            .join(', '),
                                                        style:
                                                            kRegularTextStyle,
                                                      ),
                                                    ],
                                                  ),
                                                if (def.antonyms != null &&
                                                    def.antonyms!.isNotEmpty)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 12,
                                                      ),
                                                      Text(
                                                        'Antonyms: ',
                                                        style: kSemiBoldTextStyle
                                                            .copyWith(
                                                                color: Colors
                                                                    .purple),
                                                      ),
                                                      Text(
                                                        def.antonyms!
                                                            .join(', '),
                                                        style:
                                                            kRegularTextStyle,
                                                      ),
                                                    ],
                                                  ),
                                                const SizedBox(
                                                  height: 12,
                                                ),
                                                const Divider(),
                                                const SizedBox(
                                                  height: 12,
                                                )
                                              ],
                                            )),
                                    ],
                                  )),
                            )
                          : SafeArea(
                              top: false,
                              child: Center(
                                  child: (_controller.text != "")
                                      ? const Text('Word not found')
                                      : Text(
                                          'Dictii',
                                          style: kSemiBoldTextStyle.copyWith(
                                              fontSize: 50),
                                        )),
                            )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
