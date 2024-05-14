/** @type {import('tailwindcss').Config} */
module.exports = {
	content: ['./src/**/*.{html,js,svelte,ts}'],
	darkMode: 'class',
	theme: {
		extend: {}
	},
	plugins: [require('rippleui')],
	/** @type {import('rippleui').Config} */
	rippleui: {
		defaultStyle: false,
		themes: [
			{
				themeName: 'pastel',
				colorScheme: 'light',
				prefersColorScheme: true,
				colors: {
					/* background */
					backgroundPrimary: '#FCE4EC',
					backgroundSecondary: '#F7D7E4',
					border: '#E0C2D0',
					/* base colors */
					neutral: '#FCE4EC', // Use backgroundPrimary for neutral
					primary: '#F48FB1', // Light pink for primary
					secondary: '#F7D7E4', // Use backgroundSecondary for secondary
					success: '#A5D6A7', // Light green for success
					error: '#F44336', // Reuse error from previous theme (red)
					warning: '#FBBD23', // Reuse warning from previous theme (yellow)
					info: '#90CAF9', // Reuse info from previous theme (blue)
					/* blue */
					'blue-1': '#C5CAE9', // Light blue with a hint of purple
					'blue-2': '#9FA8DA', // Slightly darker blue than blue-1
					'blue-3': '#7986CB', // Medium blue with a lavender tint
					'blue-4': '#5C6BC0', // Darker blue with a lavender tint
					'blue-5': '#3F51B5', // Deep blue with a hint of lavender
					'blue-6': '#3949AB', // Dark blue with a stronger lavender tint
					'blue-7': '#303F9F', // Very dark blue with a lavender tint
					'blue-8': '#283593', // Even darker blue with a lavender tint
					'blue-9': '#202A80', // Almost black blue with a hint of lavender
					'blue-10': '#192170', // Dark grayish blue
					'blue-11': '#12175E', // Very dark grayish blue
					'blue-12': '#0D144C', // Almost black with a hint of blue
					/* cyan */
					'cyan-1': '#D2E3EF', // Very light blue-green with a hint of pink
					'cyan-2': '#B3CCE8', // Light blue-green with a hint of pink
					'cyan-3': '#94B3D7', // Light muted cyan with a hint of pink
					'cyan-4': '#7599C6', // Muted cyan with a hint of pink
					'cyan-5': '#5680B5', // Light blue with a hint of pink (consider using info color from base)
					'cyan-6': '#4269A4', // Muted blue with a hint of pink
					'cyan-7': '#335293', // Dark muted blue with a hint of pink
					'cyan-8': '#2A4282', // Even darker muted blue with a hint of pink
					'cyan-9': '#213170', // Very dark blue with a hint of pink
					'cyan-10': '#19245E', // Dark grayish blue with a hint of pink
					'cyan-11': '#12184C', // Very dark grayish blue with a hint of pink
					'cyan-12': '#0D143A', // Almost black with a hint of blue
					/* gray */
					'gray-1': '#FDFEFE', // Very light pink-gray
					'gray-2': '#FCEAEA', // Light pink-gray
					'gray-3': '#FBD8D8', // Slightly darker pink-gray
					'gray-4': '#FACCAC', // Medium pink-gray
					'gray-5': '#F9B9B9', // Medium dark pink-gray
					'gray-6': '#F8A6A6', // Dark pink-gray
					'gray-7': '#F79393', // Very dark pink-gray
					'gray-8': '#F68080', // Almost black with a pink hint
					'gray-9': '#F56E6E', // Dark pink with a hint of red
					'gray-10': '#F45C5C', // Very dark pink with a hint of red
					'gray-11': '#F34A4A', // Almost black with a strong pink hint
					'gray-12': '#F23838', // Black with a subtle pink undertone
					/* green */
					'green-1': '#C5E1A5', // Light muted green with a hint of yellow
					'green-2': '#9FB870', // Light green with a hint of yellow
					'green-3': '#86C76A', // Medium muted green
					'green-4': '#73D162', // Light muted green with a hint of blue
					'green-5': '#5FDC5B', // Light green with a hint of blue (consider using success color from base)
					'green-6': '#52C44A', // Muted green with a hint of blue
					'green-7': '#42A63A', // Dark muted green with a hint of blue
					'green-8': '#398D2B', // Even darker muted green with a hint of blue
					'green-9': '#30731C', // Very dark muted green
					'green-10': '#285E14', // Dark green with a hint of blue
					'green-11': '#204A0E', // Very dark green with a hint of blue
					'green-12': '#000000', // Black (same as gray-12)
					/* pink */
					'pink-1': '#F7CAC9', // Light pink with a hint of lavender (lighter than backgroundPrimary)
					'pink-2': '#F48FB1', // Use primary color from base colors
					'pink-3': '#F06292', // Light pink with a hint of red
					'pink-4': '#EC407A', // Medium pink with a hint of red
					'pink-5': '#E91E63', // Light pinkish red
					'pink-6': '#D81B60', // Reuse error color from base (strong pink)
					'pink-7': '#C2185B', // Dark pinkish red
					'pink-8': '#AD1457', // Even darker pinkish red
					'pink-9': '#971053', // Very dark pinkish red
					'pink-10': '#800C4A', // Dark red with a hint of pink
					'pink-11': '#690840', // Very dark red with a hint of pink
					'pink-12': '#000000', // Black (same as gray-12)
					/* purple */
					'purple-1': '#E0C2D0', // Use border color from background
					'purple-2': '#D1A4C9', // Light lavender with a hint of pink
					'purple-3': '#C286BD', // Light purple with a hint of pink
					'purple-4': '#B368AD', // Medium purple with a hint of pink
					'purple-5': '#A44D9D', // Light muted purple
					'purple-6': '#953BA4', // Muted purple with a hint of pink
					'purple-7': '#86298C', // Dark muted purple with a hint of pink
					'purple-8': '#772074', // Even darker muted purple with a hint of pink
					'purple-9': '#68175C', // Very dark muted purple
					'purple-10': '#59144A', // Dark purple with a hint of pink
					'purple-11': '#4A0C38', // Very dark purple with a hint of pink
					'purple-12': '#000000', // Black (same as gray-12)
					/* red */
					'red-1': '#F44336', // Reuse error color from base (strong red) - Consider omitting for a softer look
					'red-2': '#E03427', // Darker red with a hint of pink
					'red-3': '#C22A1C', // Even darker red with a hint of pink
					'red-4': '#A41F11', // Very dark red with a hint of pink
					'red-5': '#861406', // Almost black red with a hint of pink
					'red-6': '#000000', // Black (same as gray-12) - Consider using a dark gray instead for a softer look
					'red-7': '#000000', // Black (same as gray-12)
					'red-8': '#000000', // Black (same as gray-12)
					'red-9': '#000000', // Black (same as gray-12)
					'red-10': '#000000', // Black (same as gray-12)
					'red-11': '#000000', // Black (same as gray-12)
					'red-12': '#000000', // Black (same as gray-12)
					/* slate */
					'slate-1': '#D7E3EB', // Light blue-gray with a hint of lavender
					'slate-2': '#C2CED6', // Light slate blue with a hint of lavender
					'slate-3': '#A7B9C5', // Medium slate blue with a hint of lavender
					'slate-4': '#8C9EA5', // Dark slate blue with a hint of lavender
					'slate-5': '#718694', // Dark blue-gray with a hint of lavender
					'slate-6': '#567383', // Dark slate blue with a stronger lavender tint
					'slate-7': '#406072', // Very dark slate blue with a lavender tint
					'slate-8': '#314C5F', // Even darker slate blue with a lavender tint
					'slate-9': '#22384C', // Almost black slate blue with a hint of lavender
					'slate-10': '#1C2A39', // Dark grayish blue with a hint of lavender
					'slate-11': '#17222F', // Very dark grayish blue with a hint of lavender
					'slate-12': '#000000', // Black (same as gray-12)
					/* yellow */
					'yellow-1': '#FBBD23', // Reuse warning color from base (light yellow)
					'yellow-2': '#F9A817', // Lighter yellow with a hint of orange
					'yellow-3': '#F7940B', // Medium yellow with a hint of orange
					'yellow-4': '#F57F00', // Dark yellow with a hint of orange
					'yellow-5': '#F06E00', // Darker yellow with a hint of orange (consider using warning color from base)
					'yellow-6': '#E06200', // Very dark yellow with a hint of orange
					'yellow-7': '#D15700', // Almost black yellow with a hint of orange
					'yellow-8': '#C24C00', // Even darker yellow with a hint of orange
					'yellow-9': '#B34100', // Very dark yellow with a hint of orange
					'yellow-10': '#A43600', // Dark orange with a hint of yellow
					'yellow-11': '#952B00', // Very dark orange with a hint of yellow
					'yellow-12': '#000000', // Black (same as gray-12)
					/* text */
					content1: '#262626', // Dark gray from grays (for primary text content)
					content2: '#565656', // Medium gray from grays (for secondary text content)
					content3: '#999999', // Light gray from grays (for disabled text content)
					whiteInverted: '#ffffff', // White (for text on dark backgrounds)
					blackInverted: '#000000' // Black (for text on light backgrounds)
				}
			}
		]
	}
};
