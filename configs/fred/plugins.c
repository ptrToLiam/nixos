typedef __SIZE_TYPE__    size_t;
typedef __PTRDIFF_TYPE__ ssize_t;
typedef __WCHAR_TYPE__   wchar_t;
typedef __PTRDIFF_TYPE__ ptrdiff_t;
typedef __PTRDIFF_TYPE__ intptr_t;
typedef __SIZE_TYPE__    uintptr_t;

#if __STDC_VERSION__ >= 201112L
typedef union { long long __ll; long double __ld; } max_align_t;
#endif

#ifndef NULL
#define NULL ((void*)0)
#endif

#undef offsetof
#define offsetof(type, field) __builtin_offsetof(type, field)

typedef signed char        int8_t;
typedef unsigned char      uint8_t;
typedef short              int16_t;
typedef unsigned short     uint16_t;
typedef int                int32_t;
typedef unsigned           uint32_t;
typedef long long          int64_t;
typedef unsigned long long uint64_t;

typedef __builtin_va_list va_list;
#define va_start __builtin_va_start
#define va_arg __builtin_va_arg
#define va_copy __builtin_va_copy
#define va_end __builtin_va_end

/* fix a buggy dependency on GCC in libio.h */
typedef va_list __gnuc_va_list;
#define _VA_LIST_DEFINED

// Basic CRT protos.
int memcmp(const void* _Buf1, const void* _Buf2, size_t _Size);
void* memcpy(void* _Dst, const void* _Src, size_t _Size);
void* memset(void* _Dst, int _Val, size_t _Size);

// Primitive types.
typedef struct Vec4i {
  union {
    struct {
      int32_t x;
      int32_t y;
      int32_t z;
      int32_t w;
    };
    struct {
      int32_t r;
      int32_t g;
      int32_t b;
      int32_t a;
    };
    struct {
      int32_t p0[2];
      int32_t p1[2];
    };
    int32_t xyzw[4];
    int32_t rgba[4];
  };
} Vec4i;

typedef struct Vec4f {
  union {
    struct {
      float x;
      float y;
      float z;
      float w;
    };
    struct {
      float r;
      float g;
      float b;
      float a;
    };
    struct {
      float p0[2];
      float p1[2];
    };
    float xyzw[4];
    float rgba[4];
  };
} Vec4f;

// OS event structures.
typedef enum OSKeyMod {
  OS_KEY_MOD_None = 0,
  OS_KEY_MOD_Shift = 0x1,
  OS_KEY_MOD_Alt = 0x2,
  OS_KEY_MOD_Opt = 0x2,
  OS_KEY_MOD_Ctrl = 0x4,
  OS_KEY_MOD_Cmd = 0x8,
  OS_KEY_MOD_AnyDown = 0xf,
} OSKeyMod;

typedef enum OSKey {
  OS_KEY_Null = 0,
  OS_KEY_Esc = 1,
  OS_KEY_F1 = 2,
  OS_KEY_F2 = 3,
  OS_KEY_F3 = 4,
  OS_KEY_F4 = 5,
  OS_KEY_F5 = 6,
  OS_KEY_F6 = 7,
  OS_KEY_F7 = 8,
  OS_KEY_F8 = 9,
  OS_KEY_F9 = 10,
  OS_KEY_F10 = 11,
  OS_KEY_F11 = 12,
  OS_KEY_F12 = 13,
  OS_KEY_F13 = 14,
  OS_KEY_F14 = 15,
  OS_KEY_F15 = 16,
  OS_KEY_F16 = 17,
  OS_KEY_F17 = 18,
  OS_KEY_F18 = 19,
  OS_KEY_F19 = 20,
  OS_KEY_F20 = 21,
  OS_KEY_F21 = 22,
  OS_KEY_F22 = 23,
  OS_KEY_F23 = 24,
  OS_KEY_F24 = 25,
  OS_KEY_Tick = 26,
  OS_KEY_Minus = 27,
  OS_KEY_Equal = 28,
  OS_KEY_Backspace = 29,
  OS_KEY_Tab = 30,
  OS_KEY_LeftBracket = 31,
  OS_KEY_RightBracket = 32,
  OS_KEY_BackSlash = 33,
  OS_KEY_CapsLock = 34,
  OS_KEY_Semicolon = 35,
  OS_KEY_Quote = 36,
  OS_KEY_Return = 37,
  OS_KEY_Shift = 38,
  OS_KEY_Comma = 39,
  OS_KEY_Period = 40,
  OS_KEY_Slash = 41,
  OS_KEY_Ctrl = 42,
  OS_KEY_Alt = 43,
  OS_KEY_Space = 44,
  OS_KEY_Menu = 45,
  OS_KEY_ScrollLock = 46,
  OS_KEY_Pause = 47,
  OS_KEY__0 = 48,
  OS_KEY__1 = 49,
  OS_KEY__2 = 50,
  OS_KEY__3 = 51,
  OS_KEY__4 = 52,
  OS_KEY__5 = 53,
  OS_KEY__6 = 54,
  OS_KEY__7 = 55,
  OS_KEY__8 = 56,
  OS_KEY__9 = 57,
  OS_KEY_Insert = 58,
  OS_KEY_Home = 59,
  OS_KEY_PageUp = 60,
  OS_KEY_Delete = 61,
  OS_KEY_End = 62,
  OS_KEY_PageDown = 63,
  OS_KEY_Up = 64,
  OS_KEY_Left = 65,
  OS_KEY_Down = 66,
  OS_KEY_Right = 67,
  OS_KEY_Ex0 = 68,
  OS_KEY_Ex1 = 69,
  OS_KEY_Ex2 = 70,
  OS_KEY_Ex3 = 71,
  OS_KEY_Ex4 = 72,
  OS_KEY_Ex5 = 73,
  OS_KEY_Ex6 = 74,
  OS_KEY_Ex7 = 75,
  OS_KEY_Ex8 = 76,
  OS_KEY_Ex9 = 77,
  OS_KEY_Ex10 = 78,
  OS_KEY_Ex11 = 79,
  OS_KEY_Ex12 = 80,
  OS_KEY_Ex13 = 81,
  OS_KEY_Ex14 = 82,
  OS_KEY_Ex15 = 83,
  OS_KEY_Ex16 = 84,
  OS_KEY_Ex17 = 85,
  OS_KEY_Ex18 = 86,
  OS_KEY_Ex19 = 87,
  OS_KEY_Ex20 = 88,
  OS_KEY_Ex21 = 89,
  OS_KEY_Ex22 = 90,
  OS_KEY_Ex23 = 91,
  OS_KEY_Ex24 = 92,
  OS_KEY_Ex25 = 93,
  OS_KEY_Ex26 = 94,
  OS_KEY_Ex27 = 95,
  OS_KEY_Ex28 = 96,
  OS_KEY_A = 97,
  OS_KEY_B = 98,
  OS_KEY_C = 99,
  OS_KEY_D = 100,
  OS_KEY_E = 101,
  OS_KEY_F = 102,
  OS_KEY_G = 103,
  OS_KEY_H = 104,
  OS_KEY_I = 105,
  OS_KEY_J = 106,
  OS_KEY_K = 107,
  OS_KEY_L = 108,
  OS_KEY_M = 109,
  OS_KEY_N = 110,
  OS_KEY_O = 111,
  OS_KEY_P = 112,
  OS_KEY_Q = 113,
  OS_KEY_R = 114,
  OS_KEY_S = 115,
  OS_KEY_T = 116,
  OS_KEY_U = 117,
  OS_KEY_V = 118,
  OS_KEY_W = 119,
  OS_KEY_X = 120,
  OS_KEY_Y = 121,
  OS_KEY_Z = 122,
  OS_KEY_Ex29 = 123,
  OS_KEY_NumLock = 124,
  OS_KEY_NumSlash = 125,
  OS_KEY_NumStar = 126,
  OS_KEY_NumMinus = 127,
  OS_KEY_NumPlus = 128,
  OS_KEY_NumPeriod = 129,
  OS_KEY_Num0 = 130,
  OS_KEY_Num1 = 131,
  OS_KEY_Num2 = 132,
  OS_KEY_Num3 = 133,
  OS_KEY_Num4 = 134,
  OS_KEY_Num5 = 135,
  OS_KEY_Num6 = 136,
  OS_KEY_Num7 = 137,
  OS_KEY_Num8 = 138,
  OS_KEY_Num9 = 139,
  OS_KEY_LeftMouseButton = 140,
  OS_KEY_MiddleMouseButton = 141,
  OS_KEY_RightMouseButton = 142,
  OS_KEY_Command = 143,
  OS_KEY_IgnoreKey = 144,
} OSKey;

// Editor command types/flags.
typedef enum EditorCommands {
  ED_SaveRequestSave, // (.cmd) Saves the current buffer if there are changes.
  ED_SaveRequest_END = 0xF,
  ED_CloseRequestClose, // (.cmd) Closes the current editor.
  ED_CloseRequest_END = 0x1F,
  ED_RequestClipboardCopy, // (.cmd) Copies selection to clipboard.  If no selection it will copy the content line.
  ED_RequestClipboardCut, // (.cmd) Copies with the same semantics as copy to clipboard, but also removes the content.
  ED_RequestClipboardPaste, // (.cmd) Inserts the content of the system clipboard into the current buffer.
  ED_RequestClipboardPasteBeforeCursor, // (.cmd) Inserts the content of the system clipboard into the buffer.  If it is a line copy, the line is pasted before the cursor line.
  ED_RequestClipboard_END = 0x2F,
  ED_FindRequestFind, // (.cmd) Opens the 'Find' widget.
  ED_FindRequestFindWithSeed, // (.cmd) Opens the 'Find' widget but seeds the search with the current selection or word under cursor.
  ED_FindRequest_END = 0x3F,
  ED_SelectionClearSelections, // (.cmd) Clears all selections.
  ED_Selection_END = 0x4F,
  ED_NavPageUp, // (.cmd,.flags) Moves cursor up by one page.
  ED_NavPageDown, // (.cmd,.flags) Moves cursor down by one page.
  ED_NavLeft, // (.cmd,.flags) Moves cursor to the left.  If at the beginning of the line, cursor will advance to end of line above.
  ED_NavRight, // (.cmd,.flags) Moves cursor to the right.  If at the end of the line, cursor will advance to the beginning of the line below.
  ED_NavRightNoNLAdvance, // (.cmd,.flags) Moves cursor to the right.
  ED_NavLineDown, // (.cmd,.flags) Moves cursor down a line maintaining column.
  ED_NavLineUp, // (.cmd,.flags) Moves cursor up a line maintaining column.
  ED_NavCursorTopScreen, // (.cmd,.flags) Moves cursor to top of viewport.
  ED_NavCursorBottomScreen, // (.cmd,.flags) Moves cursor to bottom of viewport.
  ED_NavCursorCenterScreen, // (.cmd,.flags) Moves cursor to middle of viewport.
  ED_NavBeginningOfLine, // (.cmd,.flags) Moves cursor to beginning of the line.
  ED_NavFirstNonemptyOfLine, // (.cmd,.flags) Moves cursor to first non-whitespace character of line.
  ED_NavEndOfLine, // (.cmd,.flags) Moves cursor to end of the line.
  ED_NavContentEnd, // (.cmd,.flags) Moves cursor to the end of the content.
  ED_NavContentBeginning, // (.cmd,.flags) Moves cursor to beginning of content.
  ED_NavMatchingEncloser, // (.cmd,.flags) Snaps cursor to nearest enclosing symbol.  If at an enclosing symbol, cursor will move to opposing enclosing symbol.
  ED_NavWordRight, // (.cmd,.flags) Moves cursor one word to the right.
  ED_NavChunkRight, // (.cmd,.flags) Moves cursor one word chunk to the right.
  ED_NavWordLeft, // (.cmd,.flags) Moves cursor one word to the left.
  ED_NavChunkLeft, // (.cmd,.flags) Moves cursor one word chunk to the left.
  ED_NavRequestGotoLine, // (.cmd,.flags) Opens go to line widget.
  ED_NavCenterCameraCursor, // (.cmd,.flags) Moves the camera view such that the primary cursor is in mid screen.
  ED_NavEmptyBlockUp, // (.cmd,.flags) Moves cursor to nearest empty line above.
  ED_NavEmptyBlockDown, // (.cmd,.flags) Moves cursor to nearest empty line below.
  ED_NavCursorHistoryBack, // (.cmd,.flags) Moves cursor to its previous position.
  ED_NavCursorHistoryForward, // (.cmd,.flags) Moves cursor to its next future position.
  ED_NavMoveCursorTo, // (.cmd,.flags,.byte_offsets) Moves cursor to a specific byte position in the buffer.
  ED_NavLeftNoNLAdvance, // (.cmd,.flags) Moves cursor to the left.
  ED_NavWordStart, // (.cmd,.flags) Moves cursor to the beginning of the word under it.
  ED_NavWordEnd, // (.cmd,.flags) Moves cursor to the end of the word under it.
  ED_NavLineContentJumpLeft, // (.cmd,.flags) Moves cursor to the beginning of the line content or to the absolute beginning if already there.
  ED_NavLineContentJumpRight, // (.cmd,.flags) Moves cursor to the end of the line content or to the absolute end if already there.
  ED_Nav_END = 0x4FF,
  ED_MCDupCursorDown, // (.cmd) Creates a new multi-cursor one line below.
  ED_MCDupCursorUp, // (.cmd) Creates a new multi-cursor one line above.
  ED_MCInsertGroup, // (.cmd,.buffers) Performs a unique insert per-cursor.
  ED_MCDropCursors, // (.cmd) Deletes all multi-cursors.
  ED_MCSelectionToCursor, // (.cmd) Creates a selection at the current word.  If selection exists, creates a new multi-cursor at the next identical selection.
  ED_MCCreateCursors, // (.cmd,.byte_offsets) Creates multi-cursors at the specified byte positions.
  ED_MC_END = 0x50F,
  ED_InsInsert, // (.cmd,.buf) Inserts a buffer at the cursor.
  ED_InsReplace, // (.cmd,.buf) Inserts a buffer at cursor, overwriting characters overlapping the buffer.  Does not advance cursor.
  ED_InsOverwriteInsertBuf, // (.cmd,.buf) Inserts a buffer at cursor, overwriting characters overlapping the buffer.
  ED_InsOpenLineBelow, // (.cmd) Opens a new content line below cursor.
  ED_InsOpenLineAbove, // (.cmd) Opens a new content line above cursor.
  ED_InsTab, // (.cmd) Inserts a tab (may be expanded to spaces).
  ED_InsNewline, // (.cmd) Inserts a newline and attempts to indent the next line appropriately.
  ED_Ins_END = 0x90F,
  ED_SpecJoinLineBelow, // (.cmd) Joins the content line below with the current line at cursor.
  ED_SpecTrimLineEndings, // (.cmd) Trims trailing spaces at all lines.
  ED_SpecTab, // (.cmd) Tabs a line.
  ED_SpecUntab, // (.cmd) Untabs a line.
  ED_Spec_END = 0xA0F,
  ED_DelDeleteLine, // (.cmd) Deletes the line of content at cursor.
  ED_DelDeleteChar, // (.cmd) Deletes a single character at the cursor.  If a selection is active, the selection is deleted.
  ED_DelDeleteWord, // (.cmd) Deletes a word at the cursor.  If a selection is active, the selection is deleted.
  ED_DelDeleteChunk, // (.cmd) Deletes a word chunk at cursor.  If a selection is active, the selection is deleted.
  ED_DelBackspaceWord, // (.cmd) Deletes a word before the cursor.  If a selection is active, the selection is deleted.
  ED_DelBackspaceChunk, // (.cmd) Deletes a word chunk before the cursor.  If a selection is active, the selection is deleted.
  ED_DelBackspaceChar, // (.cmd) Deletes a char before the cursor.  If a selection is active, the selection is deleted.
  ED_Del_END = 0xF0F,
  ED_URTryUndo, // (.cmd) Attemps an undo operation.
  ED_URTryRedo, // (.cmd) Attemps a redo operation.
  ED_UR_END = 0xF1F,
} EditorCommands;

typedef enum EditorCommandFlags {
  ED_FLG_None = 0, // No options.
  ED_FLG_UpdateSelection = 1 << 0, // If the cursor moves, add to the selection.
  ED_FLG_ResetCamera = 1 << 1, // Make the camera follow the cursor after command.
  ED_FLG_SuppressHistory = 1 << 2, // Suppress undo graph node for edit.
} EditorCommandFlags;

typedef enum EditorCursorStyleFlags {
  ED_CURSOR_FLG_None = 0,
  ED_CURSOR_FLG_Embolden = 0x1,
  ED_CURSOR_FLG_MarkPrimaryCursor = 0x2,
} EditorCursorStyleFlags;

typedef enum SMCLIMatcherCategory {
  SMCLI_MATCHER_CAT_Error = 0,
  SMCLI_MATCHER_CAT_Warning = 0x1,
  SMCLI_MATCHER_CAT_Note = 0x2,
} SMCLIMatcherCategory;

typedef enum ConfigValueSort {
  CFG_SORT_StrPath, // System path type
  CFG_SORT_StrFile, // File path type
  CFG_SORT_StrString, // Generic string type
  CFG_SORT_StrEnum, // Enumeration as string type
  CFG_SORT_Vec4fColor, // Color type
  CFG_SORT_Vec4iRect, // Rectangle type
  CFG_SORT_B32Toggle, // Toggle type
  CFG_SORT_S32FontSize, // Font size type
  CFG_SORT_S32Pixel, // Pixel type
  CFG_SORT_S32, // Signed integral type
  CFG_SORT_Int32Array, // Array of int32 types
  CFG_SORT_Invalid = 0xFFFFFFFF, // Invalid value
} ConfigValueSort;

// --- fred plugin API ---
// --- Infra structures ---
// Core string struct.
typedef struct String8 {
  // String pointer (null termination not necessary).
  char* str;
  // Size of string (not including any null terminator).
  uint64_t size;
} String8;

// Collection of strings.
typedef struct String8Array {
  // Pointer to strings.
  String8* strs;
  // Size of array.
  uint64_t size;
} String8Array;

// An offset into an existing string.
typedef struct String8Offset {
  // Offset into a String8.
  uint64_t off;
  // Size of substring.
  uint64_t size;
} String8Offset;


// Structure storing a key combo for testing input.
typedef struct OSKeyCombo {
  // Key to be tested.
  uint32_t key;
  // Modifiers added to key.
  uint32_t mods;
} OSKeyCombo;


// Collection of int32 types.
typedef struct Int32Array {
  // Pointer to sequence.
  int32_t* array;
  // Size of array.
  uint64_t size;
} Int32Array;

// Structure storing a collection of offsets into the buffer.
typedef struct EditorOffsetArray {
  // Pointer to offsets.
  uint64_t* array;
  // Size of array.
  uint64_t size;
} EditorOffsetArray;

// Structure storing a pair of buffer offset ranges.
typedef struct EditorOffsetRange {
  // Offset to the first byte.
  uint64_t first_off;
  // Last byte offset of the range (not inclusive).
  uint64_t last_off;
} EditorOffsetRange;

// Structure storing cursor byte offsets.
typedef struct EditorCursorRange {
  // Byte offset of the cursor.
  uint64_t cursor_off;
  // Will be non-empty if there is an active selection.
  EditorOffsetRange sel;
} EditorCursorRange;

// Structure storing a collection of cursor ranges.
typedef struct EditorCursorArray {
  // Pointer to cursor ranges.
  EditorCursorRange* array;
  // Size of array.
  uint64_t size;
} EditorCursorArray;

// Structure storing a collection of search result ranges.
typedef struct EditorFindResults {
  // Pointer to search result ranges.
  EditorOffsetRange* array;
  // Size of array.
  uint64_t size;
} EditorFindResults;

// Structure storing an instance of a text run for the UI.
typedef struct EditorEquippedText {
  // The text to be rendered.
  String8 text;
  // The color of the text.
  Vec4f color;
  // Style flags applied to the text.
  uint32_t flags;
} EditorEquippedText;

// Structure storing a collection of UI text runs.
typedef struct EditorTextRun {
  // Pointer to text runs.
  EditorEquippedText* array;
  // Size of array.
  uint64_t size;
} EditorTextRun;

// Structure storing a manipulation of the editor cursor.
typedef struct EditorCursorStyle {
  // Color of the cursor.
  Vec4f color;
  // Flags applied to the cursor.
  uint32_t flags;
} EditorCursorStyle;

// Opaque: Structure storing the result of a custom CLI output matcher.
typedef struct SMCLIMatcherResult SMCLIMatcherResult;

// Structure storing a reference to the output text that contains a path for navigation.
typedef struct SMCLIMatcherClickablePath {
  // The string offset containing the path for navigation.
  String8Offset path;
  // A string offset to a diagnostic accompanying this path location.
  String8Offset diag;
  // The specific line in the file where 'diag' occurs.
  uint64_t line;
  // The severity level of the diagnositc (SMCLIMatcherCategory).
  uint32_t sev_cat;
} SMCLIMatcherClickablePath;

// Structure storing a reference to the output text which needs to be stylized in a certain way.
typedef struct SMCLIMatcherDecoration {
  // The string offset containing the text to be decorated.
  String8Offset string;
  // The severity level of the diagnositc (SMCLIMatcherCategory).
  uint32_t sev_cat;
  // Flags indicating additional style options (unused).
  uint32_t flags;
} SMCLIMatcherDecoration;

// --- Editor batching API ---
// Structure for working with batch edits.
typedef struct EditorBatchEdit {
  // Private data.
  void* pvt[2];
} EditorBatchEdit;

// Structure storing a collection of batch offset and string buffer.
typedef struct EditorInsertData {
  // Offset to the byte to insert at.
  uint64_t off;
  // Buffer to insert.
  String8 buf;
} EditorInsertData;

// Structure storing a collection of batch offset and string buffer.
typedef struct EditorReplaceData {
  // Range of bytes to remove and replace with 'buf'.
  EditorOffsetRange range;
  // Buffer to replace at 'range'.
  String8 buf;
} EditorReplaceData;

// Structure storing a collection of batch insertions.
typedef struct EditorBatchInsert {
  // Pointer to insert operations.
  EditorInsertData* array;
  // Size of array.
  uint64_t size;
} EditorBatchInsert;

// Structure storing a collection of batch removals.
typedef struct EditorBatchRemove {
  // Pointer to removal operations.
  EditorOffsetRange* array;
  // Size of array.
  uint64_t size;
} EditorBatchRemove;

// Structure storing a collection of batch replacements.
typedef struct EditorBatchReplace {
  // Pointer to replacement operations.
  EditorReplaceData* array;
  // Size of array.
  uint64_t size;
} EditorBatchReplace;

// --- Context structures ---
// Opaque: Pointer to an allocating arena.
typedef struct Arena Arena;
// Opaque: Pointer to plugin manager instance.
typedef struct PluginManager PluginManager;
// Opaque: Pointer to UI state instance.
typedef struct UIState UIState;
// Opaque: Pointer to editor instance.
typedef struct Editor Editor;
// Opaque: Pointer simple system command instance.
typedef struct SMCLICtx SMCLICtx;
// Context structure for editor interactions.
typedef struct EditorCtx {
  // Plugin manager.
  PluginManager* mgr;
  // Calling editor.
  Editor* editor;
} EditorCtx;

// Holds persistent arena and data per-editor.
typedef struct EditorData {
  // Arena used to allocate/release data in data pointer.
  Arena* arena;
  // Persistent data point held in the editor.
  void** data;
} EditorData;

// --- Command structures ---
// Structure for queuing editor commands.
typedef struct EditorCmd {
  // Command.
  uint32_t cmd;
  // Flags applied to command.
  uint32_t flags;
  // Buffer for command.
  String8 buf;
  // Buffer collection for bulk operations.
  String8Array buffers;
  // Byte offsets into the buffer.
  EditorOffsetArray byte_offsets;
} EditorCmd;

// --- Config structures ---
// Union for holding config values.
typedef union ConfigValue {
  // Strings.
  String8 string;
  // 4 float vector.
  Vec4f vec4f;
  // 4 S32 vector.
  Vec4i vec4i;
  // Booleans.
  uint32_t b32;
  // Signed 32-bit int.
  int32_t s32;
  // Signed 32-bit int array.
  Int32Array s32array;
  // Extra padding.
  char extra[32];
} ConfigValue;

// Structure for getting/setting keyed config values.
typedef struct KeyedConfigValue {
  // Value.
  ConfigValue value;
  // Value kind.
  ConfigValueSort sort;
} KeyedConfigValue;

// --- Arenas ---
// Fetches a scratch arena that does not conflict with 'conflict'.
Arena* arena_pull_scratch(PluginManager* mgr, Arena* conflict);
// Bumps arena pointer, allocating space for the caller.
void* arena_push(Arena* a, uint64_t size, uint64_t align, uint32_t zero);
// Gets the arena position.
uint64_t arena_pos(Arena* a);
// Pops arena to specific position.
void arena_pop_to(Arena* a, uint64_t pos);

// --- OS ---
// Attempts to check if a key combo is down.  If it is, the key down event is consumed and 1 is returned, otherwise 0.
uint32_t os_key_match_internal(UIState*, OSKeyCombo*);
// If the desired key modifier is active, 1 is returned, otherwise 0.
uint32_t os_mod_active_internal(UIState*, uint32_t);
// Gets the current text event buffer.
void os_text_event_internal(UIState*, String8*);
// Eats the input text buffer event.  This is separate from key matching as keys can be a text event buffer like 'h' and have a keydown event for OS_KEY_H.
void os_eat_text_event_internal(UIState*);
// Sets the input text buffer event to a specific value.  This is useful if you only want to consume some of the input text buffer.
void os_populate_text_event_internal(UIState*, String8*);

// --- Message feed ---
// Emit an info message.
void feed_queue_info_internal(String8* str);
// Emit an warning message.
void feed_queue_warning_internal(String8* str);
// Emit an error message.
void feed_queue_error_internal(String8* str);

// --- Editor ---
// Queries.
// Populates each cursor selection (empty or not) to the 'result' array.
void ed_cursor_selections(Arena* a, EditorCtx* ctx, String8Array* result);
// Gets the cursors in the current editor.
void ed_cursor_ranges(Arena* a, EditorCtx* ctx, EditorCursorArray* result);
// Gets a string at the specified byte range.
void ed_string_at_range(Arena* a, EditorCtx* ctx, EditorOffsetRange* rng, String8* result);
// Gets the line at a given byte offset in the buffer.
uint64_t ed_line_at_offset(EditorCtx* ctx, uint64_t off);
// Gets the byte range for a specific line.  Note: Lines are 1-indexed.
void ed_byte_range_at_line(EditorCtx* ctx, uint64_t line, EditorOffsetRange* result);
// Gets the byte range for a specific line including the newline character.  Note: Lines are 1-indexed.
void ed_byte_range_at_line_with_newline(EditorCtx* ctx, uint64_t line, EditorOffsetRange* result);
// Gets the number of lines for the buffer.
uint64_t ed_line_count(EditorCtx* ctx);
// Gets the total content length for the buffer.
uint64_t ed_content_byte_count(EditorCtx* ctx);
// Returns 1 if the editor has CRLF line endings.
int32_t ed_has_crlf_endings(EditorCtx* ctx);
// Performs an immediate incremental search for 'str' over the current buffer.
void ed_find_all(Arena* a, EditorCtx* ctx, String8* str, uint32_t ignore_case, EditorFindResults* result);
// Batching.
// Starts a new batch edit.  WARNING: You must not queue new commands until the 'ed_edit_batch_end' is called.
void ed_edit_batch_begin(EditorCtx* ctx, EditorBatchEdit* batch);
// Completes the batch and recomputes internal editor state.
void ed_edit_batch_end(EditorCtx* ctx, EditorBatchEdit* batch);
// Performs a batch insert.  After calling this, you must recompute content length for subsequent batch edits.
void ed_edit_batch_insert(EditorBatchEdit* batch, EditorBatchInsert* ops);
// Performs a batch remove.  After calling this, you must recompute content length for subsequent batch edits.
void ed_edit_batch_remove(EditorBatchEdit* batch, EditorBatchRemove* ops);
// Performs a batch range replacement.  After calling this, you must recompute content length for subsequent batch edits.
void ed_edit_batch_replace(EditorBatchEdit* batch, EditorBatchReplace* ops);
// Commands.
// Pushes a new editor command.
void ed_push_command(EditorCtx* ctx, EditorCmd* cmd);
// Persistent data management.
// Creates a new persistent data context.  Any old persistent data is released.
void ed_new_persistent_data(EditorCtx* ctx, EditorData* data);
// Gets existing persistent data context.  If there is no persistent data, one is created as if 'ed_new_persistent_data' were called.
void ed_fetch_persistent_data(EditorCtx* ctx, EditorData* data);
// UI elements.
// Sets a user-defined tray.  If 'hide_default_tray' is != 0, then the usual tray content is cleared.
void ed_populate_user_defined_tray_text(EditorCtx* ctx, EditorTextRun* run, uint32_t hide_default_tray);
// Sets a user-defined cursor style.
void ed_apply_cursor_style(EditorCtx* ctx, EditorCursorStyle* style);

// --- Simple system commands ---
// Adds a path destination which can be clickable from the output text of the CLI window.
void smcli_add_clickable_path(SMCLICtx* ctx, SMCLIMatcherResult* results, SMCLIMatcherClickablePath* path);
// Decorates specific slices of the output text.  Note: Decorated pieces of text should NOT overlap.
void smcli_add_text_decoration(SMCLICtx* ctx, SMCLIMatcherResult* results, SMCLIMatcherDecoration* decoration);

// --- Config ---
// Queries the config for a specific key.  If the key does not exist, the type will be 'CFG_SORT_Invalid'.
void config_query_config_value(Arena* a, String8* key, KeyedConfigValue* result);
// Attempts to set an existing config value by key.  Will return 0 if the config value was not set.
uint32_t config_try_update_config_value(String8* key, KeyedConfigValue* val);

// --- Utility ---
// Formats a string printf-style and allocates result to specified arena.  There is a unique specifier '%S' for String8.
void str8_fmt_internal(Arena* a, String8* result, const char* fmt, va_list vlst);
// Returns -1 for 'a' < 'b', 0 for 'a' == 'b', and 1 for 'a' > 'b'.  Performs a lexicographic comparison on input strings.
int32_t str8_compare_internal(String8* a, String8* b);
// Returns 1 if the input string is an integral value of the specified radix.
uint32_t str8_is_integer_internal(String8* str, uint32_t radix);
// Converts the input string to an integral value of the specified radix.
uint64_t u64_from_str8_internal(String8* str, uint32_t radix);
// Tries to convert the intput string to a floating-point value.  Returns 0 if the conversion failed.
uint32_t try_f64_from_str8_internal(String8* str, double* result);

// --- fred API version info ---
// The version of this fred API.  If there is a mismatch, you should regenerate the API.
const uint32_t api_version = 1;

typedef struct Temp {
  void* arena;
  uint64_t pos;
} Temp;

Temp arena_temp_begin(void* arena) {
  uint64_t pos =  arena_pos(arena);
  Temp t = { .arena = arena, .pos = pos };
  return t;
}

void arena_temp_end(Temp t) {
  arena_pop_to(t.arena, t.pos);
}

// Helpers for walking.
#define EachIndex(it, count) (uint64_t it = 0; it < (count); it += 1)
#define EachLine(it, count) (uint64_t it = 1; it <= (count); it += 1)

#define FRED_Min(A, B) (((A)<(B))?(A):(B))
#define FRED_Max(A,B) (((A)>(B))?(A):(B))
#define FRED_AlignOf(T) __alignof(T)
#define push_array_no_zero_aligned(a, T, c, align) (T *)arena_push((a), sizeof(T)*(c), (align), (0))
#define push_array_aligned(a, T, c, align) (T *)arena_push((a), sizeof(T)*(c), (align), (1))
#define push_array_no_zero(a, T, c) push_array_no_zero_aligned(a, T, c, FRED_Max(8, FRED_AlignOf(T)))
#define push_array(a, T, c) push_array_aligned(a, T, c, FRED_Max(8, FRED_AlignOf(T)))

// Scratch arena creation.  You pass in a 'conflict' arena when you don't want one scratch arena to overwrite another when nested functions are involved.
#define scratch_begin(conflict) arena_temp_begin(arena_pull_scratch(ctx->mgr, (conflict)))
#define scratch_end(scratch) arena_temp_end(scratch)

// OS event processing.
#define key_match(k, ...) os_key_match_internal(state, &(OSKeyCombo){ .key = k, .mods = 0, __VA_ARGS__ })
#define mod_active(m) os_mod_active_internal(state, m)
#define os_text_event() os_text_event_(state)
#define os_eat_text_event() os_eat_text_event_internal(state)
#define os_populate_text_event(str) os_populate_text_event_(state, str)

String8 os_text_event_(UIState* state) {
  String8 result = {0};
  os_text_event_internal(state, &result);
  return result;
}

void os_populate_text_event_(UIState* state, String8 str) {
  os_populate_text_event_internal(state, &str);
}


// Feed.
void feed_queue_info(String8 msg) {
  feed_queue_info_internal(&msg);
}

void feed_queue_warning(String8 msg) {
  feed_queue_warning_internal(&msg);
}

void feed_queue_error(String8 msg) {
  feed_queue_error_internal(&msg);
}

// Strings.
typedef struct String8Slice {
  uint64_t off;
  uint64_t len;
} String8Slice;

String8 str8(char* s, uint64_t size) {
  String8 r = { .str = s, .size = size };
  return r;
}

#define str8_lit(S) str8((char*)(S), sizeof(S) - 1)

String8 str8_substr_impl(String8 str, String8Slice slice) {
  slice.off = FRED_Min(str.size, slice.off);
  slice.len = FRED_Min(str.size - slice.off, slice.len);
  str.str += slice.off;
  str.size = slice.len;
  return str;
}

#define str8_substr(str, ...) str8_substr_impl(str, (String8Slice){ .off = 0, .len = (uint64_t)-1, __VA_ARGS__ })

String8 str8_fmt(void* a, const char* fmt, ...) {
  String8 result = {0};
  va_list va;
  va_start(va, fmt);
  str8_fmt_internal(a, &result, fmt, va);
  va_end(va);
  return result;
}

int32_t str8_compare(String8 a, String8 b) {
  return str8_compare_internal(&a, &b);
}

String8 str8_copy(void* a, String8 str) {
  String8 cpy = {0};
  cpy.size = str.size;
  cpy.str = push_array_no_zero(a, char, str.size);
  memcpy(cpy.str, str.str, str.size);
  return cpy;
}

// String conversions.
// Returns 1 if the input string is an integer of the desired radix.
uint32_t str8_is_integer(String8 str, uint32_t radix) {
  return str8_is_integer_internal(&str, radix);
}

uint64_t u64_from_str8(String8 str, uint32_t radix) {
  return u64_from_str8_internal(&str, radix);
}

// Returns 0 if the conversion failed.
uint32_t try_f64_from_str8(String8 str, double* result) {
  return try_f64_from_str8_internal(&str, result);
}

// API definition hook.
typedef void(*HotkeyPluginEditorFn)(EditorCtx*);

typedef struct HotkeyPluginEditorHook {
  const char* name;
  const char* description;
  HotkeyPluginEditorFn fn;
} HotkeyPluginEditorHook;

// This is the 'ED' group.
// This is invoked when the corresponding key combo is hit or if selected through the command palette.
#define DEF_PLUGIN_EDITOR_HOOK(ui_name, desc, fn_name)                                                                 \
  void ED_ ## fn_name ## _impl_fn(EditorCtx*);                                                                         \
  HotkeyPluginEditorHook ED_ ## fn_name = { .name = ui_name, .description = desc, .fn = &ED_ ## fn_name ## _impl_fn }; \
  void ED_ ## fn_name ## _impl_fn(EditorCtx* ctx)

// General input handlers.

// This is called on each frame.  You can scan the state object for inputs, queue editor commands and consume the events.
// Note: This will not be invoked if the editor is not focused.
#define DEF_PLUGIN_EDITOR_INPUT_HOOK() \
  void INPUT_ED_impl_fn(EditorCtx* ctx, UIState* state)

// General plugin notifications.
// Invoked when a new editor is opened or the plugins are recompiled, the latter is true when 'from_recompile' is true.
// Note: You cannot queue commands from here.  This is meant for data setup.
#define DEF_PLUGIN_EDITOR_INIT_HOOK() \
  void INIT_ED_impl_fn(EditorCtx* ctx, uint32_t from_recompile)

// Simple Command CLI handlers.
// For defining custom matcher hooks.
#define DEF_SMCLI_OUTPUT_MATCHER_HOOK() \
  void OUTPUT_MATCHER_SMCLI_impl_local_fn(SMCLICtx* ctx, SMCLIMatcherResult* result, String8 output);  \
  void OUTPUT_MATCHER_SMCLI_impl_fn(SMCLICtx* ctx, SMCLIMatcherResult* result, String8* output)        \
  { OUTPUT_MATCHER_SMCLI_impl_local_fn(ctx, result, *output); }                                        \
  void OUTPUT_MATCHER_SMCLI_impl_local_fn(SMCLICtx* ctx, SMCLIMatcherResult* result, String8 output)
// Example plugins.
DEF_PLUGIN_EDITOR_HOOK("Says hello", "Says hello in each feed.", say_hello) {
  String8 str = str8_lit("Hello, world!");
  feed_queue_warning(str);
  feed_queue_error(str);
  Temp scratch = scratch_begin(NULL);
  String8 msg = str8_fmt(scratch.arena, "Hello! This is an int '%d'. This is a char '%c'. This is a float '%f'. This is a string '%S'", 42, 'C', 3.1415, str);
  feed_queue_info(msg);
  scratch_end(scratch);
}

DEF_PLUGIN_EDITOR_HOOK("Message demo", "Demos a formatted message to each feed.", message_demo) {
  Temp scratch = scratch_begin(NULL);
  String8 str = str8_lit("String");
  String8 msg = str8_fmt(scratch.arena, "Hello! This is an int '%d'. This is a char '%c'. This is a float '%f'. This is a string '%S'", 42, 'C', 3.1415, str);
  feed_queue_info(msg);
  feed_queue_warning(msg);
  feed_queue_error(msg);
  scratch_end(scratch);
}

DEF_PLUGIN_EDITOR_HOOK("Replace word with FRED", "Replaces the next word with 'FRED'", replace_w_fred) {
  EditorCmd cmd = {0};
  cmd.cmd = ED_NavWordRight;
  cmd.flags = ED_FLG_UpdateSelection;
  ed_push_command(ctx, &cmd);
  cmd.cmd = ED_InsInsert;
  cmd.flags = 0;
  cmd.buf = str8_lit("FRED");
  ed_push_command(ctx, &cmd);
}

DEF_PLUGIN_EDITOR_HOOK("Show selections", "Emits a message for each cursor selection", show_selections) {
  Temp scratch = scratch_begin(NULL);
  String8Array strings;
  ed_cursor_selections(scratch.arena, ctx, &strings);
  String8 msg = {0};
  for EachIndex(i, strings.size) {
    String8 str = strings.strs[i];
    if (str.size != 0) {
      msg = str8_fmt(scratch.arena, "[%d] = '%S'", i, str);
    }
    else {
      msg = str8_fmt(scratch.arena, "[%d] = empty", i);
    }
    feed_queue_info(msg);
  }
  scratch_end(scratch);
}

DEF_PLUGIN_EDITOR_HOOK("Change selection to snake case", "For each selection if it is PascalCase or camelCase, change it to snake_case", snake_case) {
  Temp scratch = scratch_begin(NULL);
  EditorCmd cmd = {0};
  String8Array strings;
  ed_cursor_selections(scratch.arena, ctx, &strings);
  // First, let's allocate our result array which will be inserted as a command.  The strings here will have lengths +1 for each capital letter.
  String8Array ins_buf = {0};
  ins_buf.size = strings.size;
  ins_buf.strs = push_array(scratch.arena, String8, strings.size);
  for EachIndex(i, strings.size) {
    String8 str = strings.strs[i];
    for EachIndex(j, str.size) {
      // Skip the first index because we only care about internal characters.
      if (j != 0
          && str.str[j] >= 'A'
          && str.str[j] <= 'Z') {
        ins_buf.strs[i].size += 2;
      }
      else {
        ins_buf.strs[i].size += 1;
      }
    }
  }
  // Now we can compute the result.
  const uint32_t delta = 'a' - 'A';
  char ins_char = 0;
  for EachIndex(i, strings.size) {
    String8 str = strings.strs[i];
    ins_buf.strs[i].str = push_array_no_zero(scratch.arena, char, ins_buf.strs[i].size);
    char* r_buf = ins_buf.strs[i].str;
    for EachIndex(j, str.size) {
      ins_char = str.str[j];
      if (j != 0
          && str.str[j] >= 'A'
          && str.str[j] <= 'Z') {
        *r_buf++ = '_';
        ins_char = str.str[j] + delta;
      }
      else {
          if (j == 0
              && str.str[j] >= 'A'
              && str.str[j] <= 'Z') {
            ins_char = str.str[j] + delta;
          }
          else {
            ins_char = str.str[j];
          }
      }
      *r_buf++ = ins_char;
    }
  }
  // Now we can compose the command.
  cmd.cmd = ED_MCInsertGroup;
  cmd.buffers = ins_buf;
  ed_push_command(ctx, &cmd);
  scratch_end(scratch);
}



DEF_PLUGIN_EDITOR_HOOK("Page up and center", "Moves the screen a page up and centers the screen", page_up_center) {
  EditorCmd cmd = {0};
  cmd.cmd = ED_NavPageUp;
  ed_push_command(ctx, &cmd);
  cmd.cmd = ED_NavCenterCameraCursor;
  ed_push_command(ctx, &cmd);
}

DEF_PLUGIN_EDITOR_HOOK("Page down and center", "Moves the screen a page down and centers the screen", page_down_center) {
  EditorCmd cmd = {0};
  cmd.cmd = ED_NavPageDown;
  ed_push_command(ctx, &cmd);
  cmd.cmd = ED_NavCenterCameraCursor;
  ed_push_command(ctx, &cmd);
}

DEF_PLUGIN_EDITOR_HOOK("Trim file and save", "", trim_and_save) {
  EditorCmd cmd = {0};
  cmd.cmd = ED_SpecTrimLineEndings;
  ed_push_command(ctx, &cmd);
  cmd.cmd = ED_SaveRequestSave;
  ed_push_command(ctx, &cmd);
}

DEF_PLUGIN_EDITOR_HOOK("Report line info", "Displays info about the current line.", line_info) {
    Temp scratch = scratch_begin(NULL);
    // Get the cursors first.
    EditorCursorArray cursors = {0};
    EditorCursorRange cursor_rng;
    uint64_t line;
    EditorOffsetRange line_rng;
    String8 msg;
    ed_cursor_ranges(scratch.arena, ctx, &cursors);
    for EachIndex(i, cursors.size) {
        cursor_rng = cursors.array[i];
        line = ed_line_at_offset(ctx, cursor_rng.cursor_off);
        ed_byte_range_at_line(ctx, line, &line_rng);
        msg = str8_fmt(scratch.arena, "Cursor{%I64d} | Line{%I64d} | LineRng{%I64d, %I64d}",
                        cursor_rng.cursor_off, line, line_rng.first_off, line_rng.last_off);
        feed_queue_info(msg);
    }
    scratch_end(scratch);
}

DEF_PLUGIN_EDITOR_HOOK("Replace selection with numbers", "Replaces the current selection with ascending numbers for each subsequent occurrence.", repl_all_nums) {
  Temp scratch = scratch_begin(NULL);
  // Get the cursors first.
  EditorCursorArray cursors = {0};
  ed_cursor_ranges(scratch.arena, ctx, &cursors);
  String8 repl_str = {0};
  int good = 1;
  if (cursors.size != 1) {
    String8 msg = str8_lit("Operation only supported with a single cursor");
    feed_queue_warning(msg);
    good = 0;
  }

  // The range containing the original selection.
  EditorOffsetRange off_rng;
  if (good) {
    EditorCursorRange rng = cursors.array[0];
    off_rng.first_off = rng.sel.first_off;
    off_rng.last_off = rng.sel.last_off;
    ed_string_at_range(scratch.arena, ctx, &off_rng, &repl_str);
    good = repl_str.size != 0;
  }

  // Now we're going to try and extract a 'starting' point for the numbering based on the selection.
  // We do this by the following format:
  // SELECTION_STARTNUM
  // e.g.: 'FOOBAR_10'
  // This would replace every instance of 'FOOBAR' with an ascending number starting at 10.
  // Since the first instance will have extra characters, we save the first replacement string with
  // 'initial_repl_str'.
  String8 initial_repl_str = repl_str;
  String8 sliced;
  uint64_t count_start = 0;
  if (good) {
    // First, let's see if there's an '_'.
    uint32_t found_int = 0;
    for EachIndex(i, repl_str.size) {
      if (repl_str.str[i] == '_') {
        sliced = str8_substr(repl_str, .off = i + 1);
        // Only support base-10 for now.
        if (sliced.size != 0 && str8_is_integer(sliced, 10)) {
          found_int = 1;
          break;
        }
      }
    }
    if (found_int) {
      // Also remove '1' for the '_' character.
      repl_str = str8_substr(repl_str, .len = repl_str.size - sliced.size - 1);
      count_start = u64_from_str8(sliced, 10);
    }
  }

  if (good) {
    EditorBatchEdit batch;
    // First, find every instance of the string above.
    EditorFindResults find_results = {0};
    ed_find_all(scratch.arena, ctx, &repl_str, 0, &find_results);
    // Allocate enough space for the batch.
    EditorBatchReplace repl_op = {0};
    repl_op.size = find_results.size;
    repl_op.array = push_array(scratch.arena, EditorReplaceData, repl_op.size);
    // Fill.
    for EachIndex(i, repl_op.size) {
      // Since the first selection can be different, we will special case it.
      if (find_results.array[i].first_off == off_rng.first_off) {
        repl_op.array[i].range = off_rng;
      }
      else {
        repl_op.array[i].range = find_results.array[i];
      }
      repl_op.array[i].buf = str8_fmt(scratch.arena, "%I64d", count_start);
      ++count_start;
    }
    // Iterate the lines and perform the batch replacement.
    ed_edit_batch_begin(ctx, &batch);
    ed_edit_batch_replace(&batch, &repl_op);
    ed_edit_batch_end(ctx, &batch);
  }
  scratch_end(scratch);
}

DEF_PLUGIN_EDITOR_HOOK("Toggle C-style comment line(s)", "Adds a C-style comment to selected lines or current line.", toggle_comment) {
  Temp scratch = scratch_begin(NULL);
  // Get the cursors first.
  EditorCursorArray cursors = {0};
  ed_cursor_ranges(scratch.arena, ctx, &cursors);
  String8 repl_str = {0};
  int good = 1;
  if (cursors.size != 1) {
    String8 msg = str8_lit("Operation only supported with a single cursor");
    feed_queue_warning(msg);
    good = 0;
  }

  uint64_t start_line;
  uint64_t end_line;
  uint32_t add_comment = 0;
  if (good) {
    // Find the line at the cursor selection.  Note: The selection might also be empty, but that's OK.
    start_line = ed_line_at_offset(ctx, cursors.array[0].sel.first_off);
    end_line = ed_line_at_offset(ctx, cursors.array[0].sel.last_off);
    // Pull the first line range and decide if we need to add a comment or remove one.
    EditorOffsetRange line_rng;
    ed_byte_range_at_line(ctx, start_line, &line_rng);
    String8 line_txt;
    ed_string_at_range(scratch.arena, ctx, &line_rng, &line_txt);
    uint32_t slash_count = 0;
    for (uint64_t i = 0; i < line_txt.size && i < 2; ++i) {
      slash_count += line_txt.str[i] == '/';
    }
    add_comment = slash_count != 2;

    // Create batch to iterate lines which either removes the comment or adds one.
    // Note: For selected lines which do not already have a comment, we will leave
    // them alone.
    EditorBatchEdit batch;
    ed_edit_batch_begin(ctx, &batch);
    if (add_comment) {
      // Note: Lines are inclusive ranges.
      EditorBatchInsert ins = {0};
      ins.size = (end_line - start_line) + 1;
      ins.array = push_array(scratch.arena, EditorInsertData, ins.size);
      uint64_t idx = 0;
      for (uint64_t line = start_line; line <= end_line; ++line) {
        ed_byte_range_at_line(ctx, line, &line_rng);
        ins.array[idx].off = line_rng.first_off;
        ins.array[idx].buf = str8_lit("//");
        ++idx;
      }
      ed_edit_batch_insert(&batch, &ins);
    }
    else {
      // Note: Lines are inclusive ranges.
      EditorBatchRemove rm = {0};
      rm.size = (end_line - start_line) + 1;
      rm.array = push_array(scratch.arena, EditorOffsetRange, rm.size);
      uint64_t idx = 0;
      for (uint64_t line = start_line; line <= end_line; ++line) {
        ed_byte_range_at_line(ctx, line, &line_rng);
        ed_string_at_range(scratch.arena, ctx, &line_rng, &line_txt);
        if (line_txt.size > 1 && line_txt.str[0] == '/' && line_txt.str[1] == '/') {
          rm.array[idx].first_off = line_rng.first_off;
          rm.array[idx].last_off = line_rng.first_off + 2;
        }
        ++idx;
      }
      ed_edit_batch_remove(&batch, &rm);
    }
    ed_edit_batch_end(ctx, &batch);
  }
  scratch_end(scratch);
}

//-----------------------------------------------------------------------------
// Custom Plugins
//-----------------------------------------------------------------------------


#define CURSOR_MOVE_DIRS(X) \
  X(Left) \
  X(Right) \
  X(LineUp) \
  X(LineDown) 
  
#define CURSOR_MOVE_DIR_HOOKS(dir) \
  DEF_PLUGIN_EDITOR_HOOK("Move Cursor " #dir, "Move Cursor " #dir, CursorMove##dir) \
  { \
  EditorCmd cmd = {0};\
  cmd.cmd = ED_Nav##dir; \
  ed_push_command(ctx, &cmd); }

CURSOR_MOVE_DIRS(CURSOR_MOVE_DIR_HOOKS)
// DEF_PLUGIN_EDITOR_HOOK("Move Cursor Left", 
//                        "cursor_left", 
//                        cursor_move_left) 
// {
//   EditorCmd cmd = {0};
//   cmd.cmd = ED_NavLeft;
//   ed_push_command(ctx, &cmd);
// }